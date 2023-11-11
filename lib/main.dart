import 'package:flutter/material.dart';
import 'package:frist_app/widget/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Expenses(),
      themeMode: ThemeMode.light,
    ),
  );
}
