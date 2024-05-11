class AnswerSummaryDetails {
  AnswerSummaryDetails({
    required this.answerSummaryList,
    required this.numberOfCorrectAnswer,
  });

  final List<AnswerSummary> answerSummaryList;
  final int numberOfCorrectAnswer;
}

class AnswerSummary {
  AnswerSummary({
    required this.index,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int index;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  bool get isCorrect {
    return correctAnswer == userAnswer;
  }
}
