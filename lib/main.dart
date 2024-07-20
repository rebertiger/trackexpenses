import 'package:flutter/material.dart';
import 'package:trackexpenses/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 212, 123, 227),
  brightness: Brightness.dark,
);
void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 13),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 13),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer)),
      textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          )),
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
