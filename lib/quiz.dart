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
            ),
            new Text(
              'Score: 0/0',
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
              'Is it Belgium flag?'
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: (){print('hello');},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: new Text(
                    'True',
                  ),
                ),
                new RaisedButton(
                  onPressed: (){print('hello');},
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

}