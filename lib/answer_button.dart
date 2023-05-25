import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // minimumSize: const Size.fromHeight(40),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          backgroundColor: const Color.fromARGB(255, 42, 20, 80),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        onPressed: onTap,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(height: 1.6),
        ),
      ),
    );
  }
}
