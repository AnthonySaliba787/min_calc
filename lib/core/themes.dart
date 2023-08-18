import 'package:flutter/material.dart';
import 'package:min_calc/core/button_values.dart';

Color getBtnColor(value) {
  return [
    Btn.per,
    Btn.multiply,
    Btn.add,
    Btn.subtract,
    Btn.divide,
    Btn.calculate,
    Btn.clr,
    Btn.del
  ].contains(value)
      ? const Color.fromARGB(255, 30, 30, 30)
      : const Color.fromARGB(255, 103, 103, 103);
}

Color getBtnFontColor(value) {
  return [
    Btn.per,
    Btn.multiply,
    Btn.add,
    Btn.subtract,
    Btn.divide,
    Btn.calculate,
    Btn.clr,
    Btn.del
  ].contains(value)
      ? const Color.fromARGB(255, 208, 208, 208)
      : const Color.fromARGB(255, 255, 255, 255);
}

ElevatedButtonThemeData elevatedLight() {
  return const ElevatedButtonThemeData(
    style: ButtonStyle(
      enableFeedback: true,
      surfaceTintColor: MaterialStatePropertyAll(Colors.white),
      overlayColor: MaterialStatePropertyAll(
        Color.fromARGB(148, 255, 255, 255),
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedDark() {
  return const ElevatedButtonThemeData(
    style: ButtonStyle(
      enableFeedback: true,
      surfaceTintColor: MaterialStatePropertyAll(Colors.white),
      overlayColor: MaterialStatePropertyAll(
        Color.fromARGB(147, 0, 0, 0),
      ),
    ),
  );
}

AppBarTheme appBarLight() {
  return const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    scrolledUnderElevation: 4,
  );
}

AppBarTheme appBarDark() {
  return const AppBarTheme(
    backgroundColor: Colors.black,
    surfaceTintColor: Colors.black,
    scrolledUnderElevation: 4,
  );
}
