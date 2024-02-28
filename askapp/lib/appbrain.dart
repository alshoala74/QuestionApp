import 'question.dart';

class Appbrain{
  int _questionsNumber=0;

  final List<Question> _questionGroup=[
    Question(q: 'There is 8 planet in our solar system', i: 'images/image-1.jpg', a: true),
    Question(q: 'Cats are carnivores', i: 'images/image-2.jpg', a: true),
    Question(q: 'China in the continent of Africa', i: 'images/image-3.jpg', a: false),
    Question(q: 'Earth is flat', i: 'images/image-4.jpg', a: false),
    Question(q: 'person Can live without eating meat?', i: 'images/image-5.jpg', a: true),
    Question(q: 'The sun revolves around the earth and the earth revolves around the moon', i: 'images/image-6.jpg', a: false),
    Question(q: 'Animals are not inflamed by pain', i: 'images/image-7.jpg', a: false)
    ];

  void nextQuestion(){
    if(_questionsNumber<_questionGroup.length-1){
      _questionsNumber++;
    }
  }

  String getQuestionText(){
    return _questionGroup[_questionsNumber].questionsText;
  }
  String getQuestionImage(){
    return _questionGroup[_questionsNumber].questionImage;
  }
  bool getQuestionAnswer(){
    return _questionGroup[_questionsNumber].questionAnswer;
  }

  bool isFinshed(){
    if (_questionsNumber >= _questionGroup.length-1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionsNumber=0;
  }
}