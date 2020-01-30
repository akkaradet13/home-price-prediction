import 'package:flutter/material.dart';
import 'package:prediction/tabs/confirmpage.dart';

class Inputpage extends StatelessWidget {
  int bed,
      bath,
      sqftLiving,
      sqftLot,
      floors,
      waterfront,
      view,
      condition,
      grade,
      sqftAbove,
      basement,
      sqftLiving15,
      sqftLot15;
  double lat, long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Bedrooms',
                  ),
                  onChanged: (val) {
                    bed = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter bathrooms',
                  ),
                  onChanged: (val) {
                    bath = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter house area',
                    prefixText: "sqft ",
                  ),
                  onChanged: (val) {
                    sqftLiving = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter parking area',
                    prefixText: "sqft ",
                  ),
                  onChanged: (val) {
                    sqftLot = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter floors',
                  ),
                  onChanged: (val) {
                    floors = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter waterfront',
                  ),
                  onChanged: (val) {
                    waterfront = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter view',
                  ),
                  onChanged: (val) {
                    view = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter condition',
                  ),
                  onChanged: (val) {
                    condition = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter grade',
                  ),
                  onChanged: (val) {
                    grade = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter above area',
                    prefixText: "sqft ",
                  ),
                  onChanged: (val) {
                    sqftAbove = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter basement area',
                    prefixText: "sqft ",
                  ),
                  onChanged: (val) {
                    basement = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter latitude',
                  ),
                  onChanged: (val) {
                    lat = double.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter longitude',
                  ),
                  onChanged: (val) {
                    long = double.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter living15 area',
                    prefixText: "sqft ",
                  ),
                  onChanged: (val) {
                    sqftLiving15 = int.parse(val);
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter lot15 area',
                    prefixText: "sqft ",
                  ),
                  onChanged: (val) {
                    sqftLot15 = int.parse(val);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    var body = [
                      {
                        "bedrooms": bed,
                        "bathrooms": bath,
                        "sqft_living": sqftLiving,
                        "sqft_lot": sqftLot,
                        "floors": floors,
                        "waterfront": waterfront,
                        "view": view,
                        "condition": condition,
                        "grade": grade,
                        "sqft_above": sqftAbove,
                        "sqft_basement": basement,
                        "lat": lat,
                        "long": long,
                        "sqft_living15": sqftLiving15,
                        "sqft_lot15": sqftLot15
                      }
                    ];
                    /*body=[
                    {"bedrooms": 3, "bathrooms": 1, "sqft_living": 1180, "sqft_lot": 5650, "floors": 1, "waterfront": 0, "view": 0, "condition": 3, "grade": 7, "sqft_above": 1180, "sqft_basement": 0, "lat": 47.5112, "long": -122.257, "sqft_living15": 1340, "sqft_lot15": 5650}
                    ];*/
                    
                    _onBasicAlertPressed(context,body);
                  },
                  child: Text("CONFIRM",style: TextStyle(color: Colors.white,fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//function from rflutter pkg to display alert
_onBasicAlertPressed(context,body) {
  //Alert(context: context, title: "Predicted price", desc: resp).show();
  Navigator.push(
    context, 
    MaterialPageRoute(builder: (context)=>Confirm(body:body) )
  );  
  print(body);
}

