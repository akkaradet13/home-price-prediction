import 'homepage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 7,
      navigateAfterSeconds: new MyHome(),
      title: new Text('Welcome To Home Pice Prediction',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: Image.asset('assets/images/logo.png'),
      //backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }
}