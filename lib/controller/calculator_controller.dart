import 'package:flutter/material.dart';

import 'calculators/divide.dart';
import 'calculators/math_operation.dart';
import '../model/calculator_model.dart';
import 'calculators/multiply.dart';
import 'calculators/subtract.dart';
import 'calculators/sum.dart';

class CalculatorController extends ChangeNotifier {
  final CalculatorModel model = CalculatorModel();

  void add(String value) {
    if (value == '=') {
      model.expression = model.result;
      model.result = "";
    } else if (value == 'C') {
      _clear();
    } else if (value == ',') {
      model.expression += value.replaceAll(",", ".");
      _calculateResult();
    } else {
      model.expression += value;
      _calculateResult();
    }
    notifyListeners();
  }

  void _clear() {
    model.expression = "";
    model.result = "";
  }

  void _calculateResult() {
    List<String> expressions = _splitExpressionWithOperatorsToList();
    if (expressions.length == 3) {
      var operator = expressions[1];

      late MathOperation operation;
      double result = 0;
      if (operator == '+') {
        operation = Sum();
      } else if (operator == '-') {
        operation = Subtract();
      } else if (operator == '*') {
        operation = Multiply();
      } else if (operator == '/') {
        operation = Divide();
      }
      result = operation.calculate(
          double.parse(expressions[0]), double.parse(expressions[2]));
      _formatResult(result);
    } else if (expressions.length > 3) {
      model.expression = "${model.result}${expressions[3]}";
    }
    notifyListeners();
  }

  List<String> _splitExpressionWithOperatorsToList() {
    return model.expression.splitMapJoin(
      RegExp(r'([-+*/])'),
      onMatch: (m) => m.group(0)! + '#',
      onNonMatch: (n) => n + '#',
    )
        .split('#')
        .where((element) => element.isNotEmpty)
        .toList();
  }

  void _formatResult(double result) {
    if (result % 1 == 0) {
      int resultInt = result.toInt();
      model.result = resultInt.toString();
    } else {
      model.result = result.toString();
    }
  }
}
