import 'package:flutter/material.dart';
import 'package:min_calc/core/button_values.dart';

class DataProvider extends ChangeNotifier {
  String number1;
  String operand;
  String number2;
  String value;

  DataProvider({
    this.number1 = "",
    this.operand = "",
    this.number2 = "",
    this.value = "",
  });

  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }

    notifyListeners();
  }

  void changeSign() {
    if (number1.isNotEmpty) {
      number1.toString().startsWith('-')
          ? number1 = number1.toString().substring(1)
          : number1 = '-$number1';
    } else if (number2.isNotEmpty) {
      number2.toString().startsWith('-')
          ? number2 = number2.toString().substring(1)
          : number2 = '-$number2';
    }

    notifyListeners();
  }

  // Converts output to percentage
  void convertToPercentage() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      calculate();
    }

    if (operand.isNotEmpty) {
      return;
    }

    final number = double.parse(number1);
    number1 = "${(number / 100)}";
    operand = "";
    number2 = "";
    notifyListeners();
  }

  // Clear all output
  void clearAll() {
    number1 = "";
    operand = "";
    number2 = "";
    notifyListeners();
  }

  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    double num1 = double.parse(number1);
    double num2 = double.parse(number2);

    var result = 0.0;
    switch (operand) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.subtract:
        result = num1 - num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;
      default:
    }

    number1 = "$result";

    if (number1.endsWith(".0")) {
      number1 = number1.substring(0, number1.length - 2);
    }
    operand = "";
    number2 = "";

    notifyListeners();
  }

  void appendValue(String value) {
    if (value != Btn.dot && int.tryParse(value) == null) {
      if (operand.isNotEmpty && number2.isNotEmpty) {
        calculate();
      }
      operand = value;
    } else if (number1.isEmpty || operand.isEmpty) {
      if (value == Btn.dot && number1.contains(Btn.dot)) return;
      if (value == Btn.dot && number1.isEmpty || number1 == Btn.dot) {
        value = "0.";
      }
      number1 += value;
    } else if (number2.isEmpty || operand.isEmpty || number2.isNotEmpty) {
      if (value == Btn.dot && number2.contains(Btn.dot)) return;
      if (value == Btn.dot && number2.isEmpty || number2 == Btn.dot) {
        value = "0.";
      }
      number2 += value;
    }
    notifyListeners();
  }
}
