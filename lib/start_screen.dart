import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/images/quiz-log.png",
              width: 150,
            )),
        const SizedBox(height: 40),
        const Text(
          "Learn Flutter the fun Way",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 40),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("start quiz"))
      ],
    );
  }
}
