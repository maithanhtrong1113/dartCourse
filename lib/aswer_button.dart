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
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            ),
            child: Text(
              aswerText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
