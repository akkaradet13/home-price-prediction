import 'package:flutter/material.dart';

import 'file_ubls.dart';


class History extends StatefulWidget {
  @override
  // var body;
  // var resp;
  // ThirdTab({Key key,@required this.body,this.resp}) :super(key : key);
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<History> {
    String fileContents = "No Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.green,
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'Hero',
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
                elevation: 8,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(fileContents,style: TextStyle(color: Colors.black,fontSize: 15)),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                      child: Text("Read From file",style: TextStyle(color: Colors.white,fontSize: 18)),
                      color: Colors.blue,
                      onPressed: (){
                        FileUtils.readFromFile().then((contents){
                          setState(() {
                            fileContents = contents;
                          });
                        });
                      },
                    ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}