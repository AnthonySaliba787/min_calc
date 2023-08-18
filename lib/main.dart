import 'package:flutter/material.dart';
import 'package:min_calc/provider/data_provider.dart';
import 'package:min_calc/core/themes.dart';
import 'package:min_calc/views/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var systemBrightness = MediaQuery.of(context).platformBrightness;
    bool isDark = systemBrightness == Brightness.dark;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MinCalc",
        theme: ThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          useMaterial3: true,
          canvasColor: Colors.transparent,
          colorSchemeSeed: Colors.white,
          scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,
          elevatedButtonTheme: isDark ? elevatedLight() : elevatedDark(),
          appBarTheme: isDark ? appBarDark() : appBarLight(),
        ),
        home: const CalculatorPage(),
      ),
    );
  }
}
