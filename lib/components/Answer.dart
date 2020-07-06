import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _handler;
  final String _answerText;

  Answer(this._handler, this._answerText);

  @override
  Widget build(BuildContext context) {
    return(Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: RaisedButton(
        onPressed: _handler,
        color: Colors.blue,
        padding: EdgeInsets.all(10),
        textColor: Colors.white,
        child: Text(  
          _answerText,
          style: TextStyle(fontSize: 18,),
          textAlign: TextAlign.center,
        )
      )
    ));
  }
}