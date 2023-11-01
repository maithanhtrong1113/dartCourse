import 'package:flutter/material.dart';
import 'package:frist_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 108, 195, 242),
            ),
            child: const StartScreen(),
          ),
        ),
      ),
    ),
  );
}
