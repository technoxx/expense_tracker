import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightBlue);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.blue,
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: kDarkColorScheme.secondaryContainer,
              ),
              bodyMedium: TextStyle(
                fontSize: 15,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
              bodyLarge: TextStyle(
                fontSize: 15,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
              titleMedium: TextStyle(
                fontSize: 15,
                color: kDarkColorScheme.secondaryContainer,
              ),
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
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: kColorScheme.onPrimaryContainer,
              ),
              bodyMedium: TextStyle(
                fontSize: 15,
                color: kColorScheme.onPrimaryContainer,
              ),
              bodyLarge: TextStyle(
                fontSize: 15,
                color: kDarkColorScheme.onPrimaryContainer,
              ),
              titleMedium: TextStyle(
                fontSize: 15,
                color: kDarkColorScheme.secondaryContainer,
              ),
            ),
      ),
      home: const Expenses(),
      themeMode: ThemeMode.system, //By default
    ),
  );
}
