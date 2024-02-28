class Question {
  late String questionsText;
  late String questionImage;
  late bool questionAnswer;

  Question({required String q, required String i, required bool a}) {
    questionsText = q;
    questionImage = i;
    questionAnswer = a;
  }
}