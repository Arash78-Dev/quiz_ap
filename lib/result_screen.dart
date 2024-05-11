import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_summary.dart';
import 'package:quiz_app/question_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.restartQuiz, required this.answers});

  final void Function() restartQuiz;
  final List<String> answers;

  AnswerSummaryDetails get summaryData {
    List<AnswerSummary> summary = [];
    int numberOfCorrectAnswer = 0;

    for (var i = 0; i < answers.length; i++) {
      AnswerSummary answerSummary = AnswerSummary(
          index: i,
          question: questions[i].text,
          correctAnswer: questions[i].answers[0],
          userAnswer: answers[i]);
      summary.add(answerSummary);
      if (answerSummary.userAnswer == answerSummary.correctAnswer) {
        numberOfCorrectAnswer++;
      }
    }

    return AnswerSummaryDetails(
        answerSummaryList: summary,
        numberOfCorrectAnswer: numberOfCorrectAnswer);
  }

  int get listLength {
    return questions.length;
  }

  int get numberOfCorrectAnswer {
    return summaryData.numberOfCorrectAnswer;
  }

  @override
  build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "you answer $numberOfCorrectAnswer  out of $listLength",
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),

        ...summaryData.answerSummaryList.map((value) => Column(children: [
              const SizedBox(height: 10),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  child: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color:
                                  value.isCorrect ? Colors.green : Colors.red),
                          child: Center(
                              child: Text((value.index + 1).toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )))),
                      const SizedBox(width: 30),
                      Expanded(
                          child: Column(children: [
                        Text(
                          value.question,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          value.userAnswer,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          value.correctAnswer,
                          style: const TextStyle(color: Colors.green),
                        )
                      ]))
                    ],
                  ))
            ])),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: restartQuiz,
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          child: const Text("restart quiz"),
        )
      ],
    );
  }
}
