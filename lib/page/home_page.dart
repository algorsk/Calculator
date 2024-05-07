import 'package:calcuadora/page/components/button_calc.dart';
import 'package:calcuadora/page/components/line.dart';
import 'package:calcuadora/page/components/panel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Calculadora"),
      ),
      body: Column(
        children: [
          const Panel(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                children: [
                  const Line(buttons: [
                    {'character': 'C', 'color': Colors.orange},
                    {'character': '/', 'color': Colors.orange},
                    {'character': '*', 'color': Colors.orange},
                    {'character': '%', 'color': Colors.orange}
                  ]),
                  const Line(buttons: [
                    {'character': '7'},
                    {'character': '8'},
                    {'character': '9'},
                    {'character': '+', 'color': Colors.orange}
                  ]),
                  const Line(buttons: [
                    {'character': '4'},
                    {'character': '5'},
                    {'character': '6'},
                    {'character': '-', 'color': Colors.orange}
                  ]),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Column(
                            children: const [
                              Line(buttons: [
                                {'character': '3'},
                                {'character': '2'},
                                {'character': '1'},
                              ]),
                              Line(buttons: [
                                {'character': '0', 'flex': 2},
                                {'character': ','},
                              ]),
                            ],
                          ),
                        ),
                        const ButtonCalc(character: "=", color: Colors.orange),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
