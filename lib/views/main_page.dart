// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:min_calc/core/button_values.dart';
import 'package:min_calc/core/constants.dart';
import 'package:min_calc/provider/data_provider.dart';
import 'package:min_calc/core/themes.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    String number1 = Provider.of<DataProvider>(context).number1;
    String operand = Provider.of<DataProvider>(context).operand;
    String number2 = Provider.of<DataProvider>(context).number2;

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 4,
        title: const Text(
          "MinCalc",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Output Section
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(
                    left: 20, top: 0, right: 20, bottom: 0),
                child: Text(
                  "$number1$operand$number2".isEmpty
                      ? "0"
                      : "$number1$operand$number2",
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          // Section divider
          const Divider(
            color: Color.fromARGB(157, 84, 84, 84),
            height: 25,
            thickness: 1,
            indent: 25,
            endIndent: 25,
          ),
          // Buttons Section
          Wrap(
            children: Btn.buttonValues
                .map(
                  (value) => SizedBox(
                    width: screenSize.width / 4,
                    height: screenSize.height / 9,
                    child: buildButton(value, context),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Widget buildButton(value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDouble5),
      child: Material(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            enableFeedback: true,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: getBtnColor(value),
            surfaceTintColor: getBtnFontColor(value),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDouble40),
            ),
            elevation: 4,
            shadowColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            onBtnTap(value, context);
          },
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 30,
                  color: getBtnFontColor(value),
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  // Button functionality
  void onBtnTap(String value, BuildContext context) {
    if (value == Btn.del) {
      Provider.of<DataProvider>(context, listen: false).delete();
      return;
    }

    if (value == Btn.clr) {
      Provider.of<DataProvider>(context, listen: false).clearAll();
      return;
    }

    if (value == Btn.per) {
      Provider.of<DataProvider>(context, listen: false).convertToPercentage();
      return;
    }

    if (value == Btn.calculate) {
      Provider.of<DataProvider>(context, listen: false).calculate();
      return;
    }

    if (value == Btn.negative) {
      Provider.of<DataProvider>(context, listen: false).changeSign();
      return;
    }

    Provider.of<DataProvider>(context, listen: false).appendValue(value);
  }
}
