import 'package:calcuadora/controller/calculators/math_operation.dart';

class Multiply extends MathOperation{
  @override
  double calculate(double operando1, double operando2) {
    return operando1 * operando2;
  }

}