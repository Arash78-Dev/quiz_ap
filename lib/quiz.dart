import 'package:flutter/material.dart';
import 'package:quiz_app/layoutContainer.dart';
import 'package:quiz_app/question_data.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> answers = [];

  answerQuestion(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(restartQuiz: restartQuiz , answers:answers);
      });

      answers = [];
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onAnswer: answerQuestion);
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: LayoutContainer(child: activeScreen!)));
  }
}
