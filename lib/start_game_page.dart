import 'dart:math';

import 'package:flutter/material.dart';

class StartGamePage extends StatefulWidget {
  @override
  _StartGamePageState createState() => _StartGamePageState();
}

class _StartGamePageState extends State<StartGamePage> {

  List questions = [];
  int currentQuestion = 0;
  int score = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateListOfQuestions( 20 );
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Math Game"),
        ),
        body: this.questions.isEmpty ? CircularProgressIndicator(
          backgroundColor: Colors.red,
        ) : Container(
          child: Column(
            children: <Widget>[
              Text("$score" , style: TextStyle(
                  fontSize: 30
              ),),
              Text("Score"),
              SizedBox( height: 10 ,),
              Text( this.questions[currentQuestion]['question'] ,  style: TextStyle(
                  fontSize: 50
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(onPressed: () {
                    submitAnswer(true);
                  } , child: Text("TRUE"),),
                  OutlineButton(onPressed: () {
                    submitAnswer(false);
                  } , child: Text("FALSE"),)
                ],
              )
            ],
            // QuestionContainer(),
            // AnswerContainer()
          ),
        ),
      );
    }


    //function to collect user answer
    void submitAnswer( bool answer )
    {
      Map questionAndAnswer = this.questions[currentQuestion];

      if( questionAndAnswer['answer'] == answer) {
        addScore();
        nextQuestion();
      }else{
        //if wrong print wrong
        print(" MALE ");
      }
    }

    //function next question
    void nextQuestion()
    {
      setState(() {
        this.currentQuestion++;
      });
    }

    //increment score
    void addScore()
    {
      setState(() {
        this.score++;
      });
    }


    void generateListOfQuestions( int numberOfQuestions )
    {
      List questions = [];

      for( int i = 0 ; i < numberOfQuestions ; i++)
      {
        Map questionAndAnswer = gerateQuestionAndAnswer();

        questions.add(questionAndAnswer);
      }

      setState(() {
        this.questions = questions;
      });
      print(questions);
    }

    Map gerateQuestionAndAnswer()
    {
      int a =  Random().nextInt(5) + 1;
      int b =  Random().nextInt(5) + 1;
      int c =  Random().nextInt(5) + 1;

      int correctAnswer = a + b;
      int decoy = a+c;

      bool answer = false; //instanciate anwer as false

      String question = " $a + $b = $decoy";

      if( correctAnswer == decoy)
        answer = true;

      return {
        "question" : question,
        "answer"   : answer
      };

    }
}
