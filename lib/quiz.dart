import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/question.dart';
import 'main.dart';

class Quiz extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _QuizPage();
  }

}

class _QuizPage extends State<Quiz>{
  List<Question> questions = [
    new Question('Is it Belgium flag?', true, 'assets/flags/be.png'),
    new Question('Is it Brazil flag?', false, 'assets/flags/ca.png'),
    new Question('Is it Canada flag?', true, 'assets/flags/ca.png'),
    new Question('Is it DRC flag?', true, 'assets/flags/cd.png'),
    new Question('Is it Cameroon flag?', false, 'assets/flags/cg.png'),
    new Question('Is it Syria flag?', false, 'assets/flags/eg.png'),
    new Question('Is it Germany flag?', false, 'assets/flags/fr.png'),
    new Question('Is it Senegal flag?', true, 'assets/flags/sn.png'),
    new Question('Is it USA flag?', true, 'assets/flags/us.png'),
    new Question('Is it Tanzania flag?', false, 'assets/flags/za.png'),
  ];
  int currentIndexQuestion = 0;
  int points = 0;
  int questionsPlayed = 0;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quiz'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text(
              'Question number ${currentIndexQuestion+1}',
              textScaleFactor: 2.0,
            ),
            new Text(
              'Score: $points / ${questionsPlayed}',
              textScaleFactor: 1.3,
            ),
            new Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 2.5,
              child: new Card(
                elevation: 15.0,
                child: Image.asset(
                  questions[currentIndexQuestion].assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Text(
              questions[currentIndexQuestion].description,
              textScaleFactor: 1.5,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: (){
                    checkResponse(questions[currentIndexQuestion], true);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: new Text(
                    'True',
                  ),
                ),
                new RaisedButton(
                  onPressed: (){
                    checkResponse(questions[currentIndexQuestion], false);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: new Text(
                    'False',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void checkResponse(Question question,bool response) {
    bool result = false;
    if (question.valid == response) {
      result = true;
    }
    dialogResponse(context, result);
  }

  Future dialogResponse(BuildContext context,bool valid) async{

    String assetPath = 'assets/true.jpg';
    String title = 'Congratulation!';
    Color titleColor = Colors.green;

    if(!valid){
      title = 'Failed';
      assetPath = 'assets/false.jpg';
      titleColor = Colors.red;
    }

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return new SimpleDialog(
          title: new Text(
            title,
            textAlign: TextAlign.center,
            textScaleFactor: 1.2,
            style: new TextStyle(
              color: titleColor,
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          children: <Widget>[
            new Container(
              child: Image.asset(
                assetPath,
              ),
              margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
            ),
            new RaisedButton(
              onPressed: (){
                Navigator.pop(context);
                setState(() {
                  questionsPlayed++;
                  if(valid)
                    points++;
                  if(currentIndexQuestion < questions.length-1) {
                    currentIndexQuestion++;
                  }
                  else{
                    alertFinish(context);
                  }
                });
              },
              child: new Text(
                'Next',
              ),
              color: Colors.blue,
              textColor: Colors.white,
            )
          ],
        );
      },
    );
  }

  Future alertFinish(BuildContext context) async{

    String title = 'Finish';

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return new AlertDialog(
          title: new Text(
            title,
            textAlign: TextAlign.center,
            textScaleFactor: 1.2,
          ),
          contentPadding: EdgeInsets.all(10.0),
          content: new Text
            (
            'You have $points points on ${questions.length} questions',
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: (){
                Navigator.pop(context);
                setState(() {
                  currentIndexQuestion = 0;
                  points = 0;
                });
              },
              child: new Text(
                  'Replay'
              ),
            ),
            new FlatButton(
              onPressed: (){
                Navigator.pop(context);
                backHome();
              },
              child: new Text(
                  'Back to Home page'
              ),
            ),
          ],
        );
      },
    );
  }

  void backHome(){
    Navigator.pop(context);
  }

}