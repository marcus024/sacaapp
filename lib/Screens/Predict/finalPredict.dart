import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:saca/Screens/Predict/route.dart';
import 'package:saca/constants.dart';
import 'package:http/http.dart' as http;

class Predict extends StatefulWidget {
  const Predict({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PredictState createState() => _PredictState();
}
class _PredictState extends State<Predict>{
String url = '';
var data ;
String output = 'Initial Output';


  @override
  Widget build(BuildContext context) {  
    return Scaffold(
appBar : AppBar(
 leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
         ),
     backgroundColor: Color(0xff0e9229),
       title: const Text("Crop Yields Prediction"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 5.00,
),
body:  Column(children: <Widget> [
  SizedBox(height: 20,),
  Container(
       child :Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
              onChanged: (value){
                url = 'http://10.0.2.2:5000/bananapredict_api' ;
              },
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Enter Temperature",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.hot_tub_outlined),
                ),
              ),
             validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }
    return null;
  },
          ),
        ),
  ),
  SizedBox(height: 2,),

   Container(
       child :Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
             onChanged: (value){
                url = 'http://10.0.2.2:5000/bananapredict_api';
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(

                hintText: "Enter Humidity",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.landscape_sharp),
                ),
              ),
             validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }
    return null;
  },
          ),
        ),
  ),
  SizedBox(height: 2,),


 Container(
       child :Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
             onChanged: (value){
                url = 'http://10.0.2.2:5000/bananapredict_api' ;
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(

                hintText: "Enter Soil Moisture",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.mode_edit_sharp),
                ),
              ),
             validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }
    return null;
  },
          ),
        ),
  ),
  SizedBox(height: 2,),


   Container(
       child :Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: TextFormField(
             onChanged: (value){
                url = 'http://10.0.2.2:5000/bananapredict_api';
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(

                hintText: "Enter Area",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.area_chart_outlined),
                ),
              ),
             validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }
    return null;
  },
          ),
        ),
  ),
  SizedBox(height: 10,),

 ElevatedButton.icon(   // <-- ElevatedButton
      onPressed: ()  async {
        data = await fetchdata(url);
       var decoded  = jsonDecode(data);
        setState(() {
          output = decoded['output'];
        });
     /*  showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Predicted Yields"),
                  content: const Text("There are 230 pounds of rice"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                       
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("Confirm",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
                
              );
              */
      },
     
      style: ElevatedButton.styleFrom(
      primary: Color(0xff0e9229)
      ),
      icon: Icon(
        Icons.line_axis_outlined,
        size: 24.0,
        color: Colors.white,
      ),
      label: Text('Forecast'),
    ),
    SizedBox(height: 3,),
    Text(output)


]),


    );
  }
}