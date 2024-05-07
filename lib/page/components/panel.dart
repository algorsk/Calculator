import 'package:calcuadora/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_text.dart';

class Panel extends StatelessWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultModel = Provider.of<CalculatorController>(context);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.only(left: 5),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: resultModel.model.expression),
            CustomText(
                text: resultModel.model.result,
                color: Colors.black,
                align: TextAlign.right),
          ],
        ),
      ),
    );
  }
}
