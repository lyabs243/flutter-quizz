import 'package:flutter/material.dart';

class Quiz extends StatelessWidget{

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
              'Question number 1',
              textScaleFactor: 2.0,
            ),
            new Text(
              'Score: 0/0',
              textScaleFactor: 1.3,
            ),
            new Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 2.5,
              child: new Card(
                elevation: 15.0,
                child: Image.asset(
                    'assets/flags/be.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Text(
              'Is it Belgium flag?',
              textScaleFactor: 1.5,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: (){
                    alertFinish(context);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: new Text(
                    'True',
                  ),
                ),
                new RaisedButton(
                  onPressed: (){
                    dialogResponse(context, true);
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
            'You have 3 points on 5 questions',
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: new Text(
                'Replay'
              ),
            ),
            new FlatButton(
              onPressed: (){
                Navigator.pop(context);
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

}