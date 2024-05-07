import 'package:flutter/material.dart';

import 'button_calc.dart';

class Line extends StatelessWidget {
  final List<Map<String, dynamic>> buttons;
  const Line({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            for (var button in buttons)
              ButtonCalc(
                character: button['character'],
                flex: button['flex'] ?? 1,
                color: button['color'] ??  Colors.black54,
              ),
          ],
        ),
      ),
    );
  }
}
