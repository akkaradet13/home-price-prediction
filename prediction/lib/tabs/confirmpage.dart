import 'package:flutter/material.dart';
import 'package:prediction/tabs/historypage.dart';
import 'file_ubls.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Confirm extends StatefulWidget {
  @override
  var body ;
  var price;
  Confirm({Key key,@required this.body}) :super(key : key);
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: Colors.green,
      ),
      //backgroundColor: Colors.green,
      body: _showtext(widget.body,context),
    );
  }
}
Widget _showtext(body,context){
  try {
    return GestureDetector(
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
                      Text(''),
                      Text('Confirm transaction',style: TextStyle(fontSize: 25)),
                      Text('bedrooms : '+body[0]['bedrooms'].toString(),style: TextStyle(fontSize: 20)),
                      Text('bathrooms : '+body[0]['bathrooms'].toString(),style: TextStyle(fontSize: 20)),
                      Text('house area : '+body[0]['sqft_living'].toString()+' sqft',style: TextStyle(fontSize: 20)),
                      Text('parking area : '+body[0]['sqft_lot'].toString()+' sqft',style: TextStyle(fontSize: 20)),
                      Text('view : '+body[0]['view'].toString(),style: TextStyle(fontSize: 20)),
                      Text('condition : '+body[0]['condition'].toString(),style: TextStyle(fontSize: 20)),
                      Text('grade : '+body[0]['grade'].toString(),style: TextStyle(fontSize: 20)),
                      Text('above area : '+body[0]['sqft_above'].toString()+' sqft',style: TextStyle(fontSize: 20)),
                      Text('Basement area : '+body[0]['sqft_basement'].toString()+' sqft',style: TextStyle(fontSize: 20)),
                      Text('latitude : '+body[0]['lat'].toString(),style: TextStyle(fontSize: 20)),
                      Text('longitude : '+body[0]['long'].toString(),style: TextStyle(fontSize: 20)),
                      Text('living15 area : '+body[0]['sqft_living15'].toString()+' sqft',style: TextStyle(fontSize: 20)),
                      Text('lot15 area : '+body[0]['sqft_lot15'].toString()+' sqft',style: TextStyle(fontSize: 20)),
                      Text(''),
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () async {
                          var resp = await predictPrice(body);
                          await _showandsaveprice(context,body,resp);
                        },
                        child: Text("GET PRICE AND SAVE DATA",style: TextStyle(color: Colors.white,fontSize: 18)),
                      ),
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () async {
                          var resp = await predictPrice(body);
                          await _showprice(context,resp);
                        },
                        child: Text("GET PRICE",style: TextStyle(color: Colors.white,fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            ),
        ),
      );
  } catch (e) {
    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('!!! No data !!!',),
              ],
            ),
          ),
      );
  }
  
}

Future<String> predictPrice(var body) async {
  //using
  var client = new http.Client();
  var uri = Uri.parse("https://5783034d.ngrok.io/predict");
  Map<String, String> headers = {"Content-type": "application/json"};
  String jsonString = json.encode(body);
  try {
    var resp = await client.post(uri, headers: headers, body: jsonString);
    //var resp=await http.get(Uri.parse("http://0.0.0.0:5000"));
    if (resp.statusCode == 200) {
      print("DATA FETCHED SUCCESSFULLY");
      var result = json.decode(resp.body);
      print(result["prediction"]);
      //return result["predicction"];
      return result["prediction"];
    }
  } catch (e) {
    print("EXCEPTION OCCURRED: $e");
    return "EXCEPTION OCCURRED: $e";
  }
  // //test
  // var price = '555' ;
  // return price;
}

_showprice(context, resp) {
  Alert(context: context, title: "Predicted price", desc: resp).show();
}

_showandsaveprice(context,body,resp){
  var data = body[0];
  FileUtils.saveToFile(
    'bedrooms : '+data['bedrooms'].toString()+'\n'+
    'bathrooms : '+data['bathrooms'].toString()+'\n'+
    'house area : '+data['sqft_living'].toString()+' sqft \n'+
    'parking area : '+data['sqft_lot'].toString()+' sqft \n'+
    'view : '+data['view'].toString()+'\n'+
    'condition : '+data['condition'].toString()+'\n'+
    'grade : '+data['grade'].toString()+'\n'+
    'above area : '+data['sqft_above'].toString()+' sqft \n'+
    'Basement area : '+data['sqft_basement'].toString()+' sqft \n'+
    'latitude : '+data['lat'].toString()+'\n'+
    'longitude : '+data['long'].toString()+'\n'+
    'living15 area : '+data['sqft_living15'].toString()+' sqft \n'+
    'lot15 area : '+data['sqft_lot15'].toString()+' sqft\n'+
    'price : '+resp.toString()+' Dollar'
  );
  
  Navigator.push(
    context, MaterialPageRoute(
      builder: (context)=>History()
    ),
  ); 
}
