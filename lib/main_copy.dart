import 'dart:math';

import 'package:flutter/material.dart';

import 'model/QandA.dart';

void main() {
  runApp(MainPage());
}

class MainRunnableS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<QandA> questionsLists = [];

  int currentQuestion = 0;
  int score = 0;

  void initState() {
    // TODO: implement initState
    super.initState();

    genereateQuestionList(10);

    print(questionsLists);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Math Game"),
        ),
        body: Container(
          child: questionsLists.isEmpty ? CircularProgressIndicator(
            backgroundColor: Colors.red,
          ) : Column(
            children: [

              Text("SCORE : $score" , style: TextStyle(
                  fontSize: 30,
                  color: Colors.red
              ),),

              Text(getCurrentQuestion().question, style: TextStyle(
                  fontSize: 40
              ),),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(onPressed: () {
                    submitAnswer(true);
                  } , child: Text("TRUE"),),
                  OutlineButton(onPressed: () {
                    submitAnswer(false);
                  } , child: Text("FALSE"),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  QandA getCurrentQuestion()
  {
    return questionsLists[currentQuestion];
  }

  QandA generateRandomQuestion()
  {
    /*
    * create a 3 random generated numbers*
    * */
    int a = Random().nextInt(5) + 1;
    int b = Random().nextInt(5) + 1;
    int c = Random().nextInt(5) + 1;

    int correctAnswer = a+b;
    int decoy = c + b;

    bool answer = false;//lets instnaciate the answer as false

    String question = "$a + $b = $decoy";

    if( correctAnswer == decoy)
      answer = true;

    return QandA(question:  question , answer:  answer);
  }

  void genereateQuestionList( int length)
  {
    List questionList = <QandA>[];

    for(int i = 0 ; i <= length ;i++) {
      QandA question = generateRandomQuestion();
      questionList.add(question);
    }

    setState(() {
      this.questionsLists = questionList;
    });
    // print(questionList);

    // setState(() {
    //   questions = questionList;
    // });
  }

  void submitAnswer(bool answer)
  {
    QandA qandA = questionsLists[currentQuestion];

    if(qandA.answer == answer){
      setState(() {
        score++;
      });
    }else{
      print("Incorrect question");
    }
    nextQuestion();
  }

  void nextQuestion()
  {
    setState(() {
      currentQuestion++;
    });

    if( currentQuestion >= questionsLists.length) {
      genereateQuestionList(15);
      setState(() {
        currentQuestion = 0;
      });

      print( this.questionsLists);
    }else{

    }
  }

}
