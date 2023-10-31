import 'package:flutter/material.dart';
import 'package:frist_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: GradientContainer(Colors.cyan, Colors.green),
      ),
    ),
  );
}
