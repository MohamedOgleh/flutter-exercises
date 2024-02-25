class Question {
  final String question;
  List<String> answers;

  final String correctAnswer;

  static int correct = 0;
  static int wrong = 0;

  Question(this.question, this.answers, this.correctAnswer);
}
