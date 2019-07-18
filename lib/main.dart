import 'package:flutter/material.dart';
import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Quiz app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Card(
                elevation: 25.0,
                child: new Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image.asset
                    (
                    'assets/cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new RaisedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context){
                          return new Quiz();
                        }
                    ),
                  );
                },
                child: new Text('Start quiz'),
                color: Colors.blue,
                textColor: Colors.white,
              )
            ],
          ),
      )
    );
  }
}
