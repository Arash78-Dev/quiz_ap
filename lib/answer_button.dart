import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const AnswerButton(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(text));
  }
}
