import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';


var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple);


void main() {
  runApp(MaterialApp(
    home: Expenses(),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer
      ),
      cardTheme: CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: EdgeInsets.symmetric(horizontal: 18,vertical: 8)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer
        )
      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: kColorScheme.onSecondaryContainer,
        )
      )
    )
  ));

}
