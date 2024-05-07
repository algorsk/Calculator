
import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  String _expression = "";
  String _result = "";

  String get expression => _expression;
  set expression(String value) {
    _expression = value;
  }

  String get result => _result;
  set result(String value) {
    _result = value;
  }
}
