import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.aswerText,
    required this.onTap,
  });
  final String aswerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 53, 171, 230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        child: Text(
          aswerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
