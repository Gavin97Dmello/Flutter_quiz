import 'package:flutter/material.dart';
import './components/Question.dart';
import './components/Answer.dart';

void main() => runApp(Quiz());


class Quiz extends StatefulWidget {
  @override

State<StatefulWidget> createState(){

  return QuizState();
}
}

class QuizState extends State<Quiz> {
  var _questionIndex = 0;
  var _didStart = false;
  final questions = const[{
    'index': 1,
    'text': 'Which company do you work in?',
    'answers': ['Fit.co', 'Zaya Learning Labs', 'Hansa CEquity', 'Majesco'], 
  },
  {
    'index': 2,
    'text': 'What is your role?',
    'answers': ['HR', 'CEO', 'Software Developer', 'Product Manager'], 
  },
  {
    'index': 3,
    'text': 'How long have you been working as a professional?',
    'answers': ['> a year', '1 year', '> 1+ year ', '5+ years '], 
  },
  ];

  void _nextQuestion () {
    setState(() {
      _questionIndex += 1; 
    });
  }

  void _startQuiz () {
    setState(() {
      _didStart  = !_didStart; 
      _questionIndex = 0;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz time!'),
        ),
        body: _didStart? Container(child: (_questionIndex < questions.length) ? Column(
          children: [
            Question(questions[_questionIndex]['text']),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_nextQuestion, answer);
            }).toList(),
          ])
          :
//           Container(
//                   width: double.infinity,
// height: double.infinity,
//         color: Colors.green,
// child: Align(
//   alignment: Alignment.center,
//   child: 
//   Container(
//             color: Colors.red,
//  child:
          // Column(children: [
            // Text('Quiz ended',
            // style: TextStyle(fontSize: 15),
            // textAlign: TextAlign.center,
            // ),
            Center(child: RaisedButton(
        onPressed: _startQuiz,
        color: Colors.blue,
        padding: EdgeInsets.all(10),
        textColor: Colors.white,
        child: Text(  
          'Retake',
          style: TextStyle(fontSize: 18,),
          textAlign: TextAlign.center,
        )
      )
          // ])
          // )
          // ) )
        )): 
        Center(child: 
            Container(
              margin: EdgeInsets.all(5),
              child: RaisedButton(
                onPressed: _startQuiz,
                color: Colors.blue,
                padding: EdgeInsets.all(10),
                textColor: Colors.white,
                child: Text(  
                  'Start Quiz',
                  style: TextStyle(fontSize: 18,),
                  textAlign: TextAlign.center,
                )
              )
            ))
          ) 
      );


  
  }
}
