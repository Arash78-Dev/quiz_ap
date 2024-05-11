class QuizQuestionModel {
  final String text;
  final List<String> answers;

  List<String> get shuffledAnswer {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  QuizQuestionModel(this.text, this.answers);
}
