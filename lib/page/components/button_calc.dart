import 'package:calcuadora/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonCalc extends StatelessWidget {
  final String character;
  final Color color;
  final int flex;

  const ButtonCalc(
      {Key? key,
      required this.character,
      this.flex = 1,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(35),
        onTap: () {
          Provider.of<CalculatorController>(context, listen: false).add(character);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 5, left: 5, top: 5),
          decoration: BoxDecoration(
            // color: color,
            gradient: RadialGradient(
              colors: [Colors.white, color],
              center: Alignment.topCenter,
              radius: 0.8,
            ),
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(2, 2),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              character,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
