import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/layoutContainer.dart';
import 'package:quiz_app/question_data.dart';
import 'package:quiz_app/start_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswer});

  final void Function(String answer) onAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuestionScreen> {
  var currentQuestion = 0;

  void answerQuestion(String answer) {
    widget.onAnswer(answer);

    if (currentQuestion != questions.length - 1) {
      setState(() {
        currentQuestion = currentQuestion + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(questions[currentQuestion].text,
                    style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 30),
              ...questions[currentQuestion]
                  .shuffledAnswer
                  .map((value) => AnswerButton(value, () {
                        answerQuestion(value);
                      }))
            ]));
  }
}
