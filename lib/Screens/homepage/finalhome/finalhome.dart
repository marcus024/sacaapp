import 'dart:ui';
import 'package:flutter/src/widgets/image.dart' as Image;
import 'package:saca/Screens/Detect/NewCode.dart';
import 'package:saca/Screens/Detect/camera_page.dart';
import 'package:saca/Screens/Predict/option/predModel.dart';
import 'package:saca/Screens/Profile/settings.dart';
import 'package:saca/main.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:saca/Screens/Pests/pestScreen.dart';
import 'package:saca/Screens/Predict/finalPredict.dart';
import 'package:saca/Screens/Profile/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image/image.dart';
import '../../Detect/finaldetect.dart';
import '../../crops/CropData.dart';
import 'package:camera/camera.dart';
class Home extends StatefulWidget {

   @override
  State<Home> createState() => _HomePageState();

}

class _HomePageState extends State<Home> {
 String? name = '';

Future _getDataFromDatabase() async 
{
  await FirebaseFirestore.instance.collection('users')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .get()
    .then((snapshot) async 
    
    {
      if(snapshot.exists)
      {
        setState(() {  
          name = snapshot.data()!["name"];
       
         
        });
      }


    } );
}

//Edit User's Profile from Firestore
@override
void initState(){
  super.initState();
  _getDataFromDatabase();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar : PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
         
 leading: IconButton(
        icon: Icon(Icons.person),
        color: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>EditProfilePage() ));
        },
         ),
  
     backgroundColor: Colors.green[600],
       title:  Text("Hi, " +(name ?? " null ") + " !" ,
       style: TextStyle(color: Colors.white ,fontSize: 14,fontStyle: FontStyle.italic),
       ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 50.2,
        toolbarOpacity: 0.8,
        elevation: .500,
),
    ),
    body: SingleChildScrollView(
      child: Column(
         children: <Widget>[
      Container(
        width: 400,
        height: 110,
       
        decoration: BoxDecoration(
          color: Colors.green[600],
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0)),
        ),
        child: Padding(padding: EdgeInsets.all(30),
        child: TextField(
      decoration: InputDecoration(
      suffixIcon :IconButton(
        onPressed: () => Predict(),
        icon: Icon(Icons.search),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.greenAccent[700]),
        hintText: "Search",
        fillColor: Colors.white),
    )
        ), 
        ),
    
         Container(
        width: 400,
        height: 110,
        
        child: Padding(padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //change here don't //worked
          children: [
            //Detect Button
           Padding(padding: EdgeInsets.all(10),
           child: GestureDetector(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => newDetect() ));
            },
             child: Container(
              width: 65,
              height: 65,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.white,
                   boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 7.0,
                    spreadRadius: 0.0,
                    offset: Offset(3.0, 2.0), // shadow direction: bottom right
                )
                   ],
               ),
            //  child: Icon(Icons.search_off_rounded),
              child: Padding(padding: EdgeInsets.all(10),
              child: Column(
                children:<Widget> [
                  Container(
                    child: Icon(Icons.search_outlined),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    child: Text("Detect"),
                  )
                ],
              ),
              ),
    
    
             ),
           )
           
           ),
           //Predict Button
             Padding(padding: EdgeInsets.all(10),
           child: GestureDetector(
            onTap: () {
               //Navigator.push(context, MaterialPageRoute(builder: (context) =>Predict() ));
               Navigator.push(context, MaterialPageRoute(builder: (context) =>const Predict() ));
            },
             child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.white,
                   boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 7.0,
                    spreadRadius: 0.0,
                    offset: Offset(3.0, 2.0), // shadow direction: bottom right
                )
                   ],
               ),
             child: Padding(padding: EdgeInsets.all(10),
              child: Column(
                children:<Widget> [
                  Container(
                    child: Icon(Icons.line_axis_outlined),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    child: Text("Predict"),
                  )
                ],
              ),
              ),
    
             ),
           )
           
           ),
    
            Padding(padding: EdgeInsets.all(10),
           child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>CropsGrid() ));
            },
             child: Container(
              width: 65,
              height: 65,
             decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.white,
                   boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 7.0,
                    spreadRadius: 0.0,
                    offset: Offset(3.0, 2.0), // shadow direction: bottom right
                )
                   ],
               ),
            
           child: Padding(padding: EdgeInsets.all(10),
              child: Column(
                children:<Widget> [
                  Container(
                    child: Icon(Icons.grass),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    child: Text("Crops"),
                  )
                ],
              ),
              ),
             ),
           )
           
           ),
             Padding(padding: EdgeInsets.all(10),
           child: GestureDetector(
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>PestGrid() ));
            },
             child: Container(
              width: 65,
              height: 65,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.white,
                   boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 7.0,
                    spreadRadius: 0.0,
                    offset: Offset(3.0, 2.0), // shadow direction: bottom right
                )
                   ],
               ),
              child: Padding(padding: EdgeInsets.all(10),
              child: Column(
                children:<Widget> [
                  Container(
                    child: Icon(Icons.bug_report_outlined),
                  ),
                  SizedBox(height: 3,),
                  Container(
                    child: Text("Pests"),
                  )
                ],
              ),
              ),
    
             ),
           )
           )
          ],
        ),
        ), 
        ),
        const SizedBox(height: 3,),
        Center(
          child: Container(
             width: 350,
             height: 130,
             decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(40.0),
                   color: Colors.green,
                   boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    spreadRadius: 0.0,
                     offset: Offset(3.0, 2.0),
                   // shadow direction: bottom right
                )
                   ],
               ),
            child: Column(
              children: <Widget> [
                Padding(padding: EdgeInsets.all(10),
                child: Container(alignment: Alignment.center,
                child: Text("    Monthly Subscription",
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                ), ),
                ),
                 Padding(padding: EdgeInsets.all(2),
                child: Container(alignment: Alignment.center,
                child: Text("Php 50",
                style: TextStyle(color: Colors.yellow,fontSize: 40,fontWeight: FontWeight.bold),
                ),
         
                ),
                
                ),
                 Padding(padding: EdgeInsets.all(10),
                child: Container(alignment: Alignment.bottomCenter,
                child: Text("This promo will be valid soon in the next update.",
                style: TextStyle(color: Colors.yellow,fontSize: 12,fontStyle: FontStyle.italic),
                ), ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 3,),
        Container(
          alignment: Alignment.topLeft,
         child: Padding(padding: EdgeInsets.all(10),
         child: Text("Trivias and Facts",
         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25
          ),),
         ),
        ),
      Center(
        child: Container(
         // color: Colors.green,
          width: 350,
          height: 120,
         
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                child: Container(
                  width: 150,
                  height: 100,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(40.0),
                       color: Colors.white,
                       boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                         offset: Offset(3.0, 2.0),
                       // shadow direction: bottom right
                    )
                       ],
                   ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(8),
                      // ignore: prefer_const_constructors
                      child: Center(
                        child: Text("TOP 10 BEST \n FERTILIZER",style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                      ),
                      Padding(padding: EdgeInsets.all(2),
                      // ignore: prefer_const_constructors
                      child: TextButton(
                        onPressed: () {
            
                        }, child: Text("View",style: TextStyle(color: Colors.green),),
                      )
                      ),
                    ],
                  ),
                ),
                ),
          
                 Padding(
                  padding: EdgeInsets.all(10),
                child: Container(
                  width: 150,
                  height: 100,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(40.0),
                       color: Colors.white,
                       boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                         offset: Offset(3.0, 2.0),
                       // shadow direction: bottom right
                    )
                       ],
                   ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(8),
                      // ignore: prefer_const_constructors
                      child: Center(
                        child: Text("TOP 10 BANANA \n FARMERS ",style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                      ),
                      Padding(padding: EdgeInsets.all(2),
                      // ignore: prefer_const_constructors
                      child: TextButton(
                        onPressed: () {
                          
                        }, child: Text("View",style: TextStyle(color: Colors.green),),
                      )
                      ),
                    ],
                  ),
                ),
                )
          
          
              ]
              ),
          ),
        ),
      ),
        Container(
          alignment: Alignment.topLeft,
         child: Padding(padding: EdgeInsets.all(10),
         child: Text("Farmers in the Phillippines",
         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25
          ),),
         ),
        ),
        Container(
          width: 350,
          height: 70,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(1),
                child: Container(
                  width: 70,
                  height: 70,
                 
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(1),
                      child: Container(
                        height: 45,
                        width: 45,
                   decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40.0),
                         color: Colors.yellow,
                         boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 3.0,
                          spreadRadius: 0.0,
                           offset: Offset(3.0, 2.0),
                         // shadow direction: bottom right
                      )
                         ],
                     ),
    
                      ),
                      ),
                       Padding(padding: EdgeInsets.all(1),
                      child: Center(
                       child: Text("John",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),)
                    ],
                  ),
                )
                ,),
    
                 Padding(padding: EdgeInsets.all(1),
                child: Container(
                  width: 70,
                  height: 70,
                 
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(1),
                      child: Container(
                        height: 45,
                        width: 45,
                   decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40.0),
                         color: Colors.red,
                         boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 3.0,
                          spreadRadius: 0.0,
                           offset: Offset(3.0, 2.0),
                         // shadow direction: bottom right
                      )
                         ],
                     ),
    
                      ),
                      ),
                       Padding(padding: EdgeInsets.all(1),
                      child: Center(
                       child: Text("Peter",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),)
                    ],
                  ),
                )
                ,),
    
    
                 Padding(padding: EdgeInsets.all(1),
                child: Container(
                  width: 70,
                  height: 70,
                 
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(1),
                      child: Container(
                        height: 45,
                        width: 45,
                   decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40.0),
                         color: Colors.blue,
                         boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 3.0,
                          spreadRadius: 0.0,
                           offset: Offset(3.0, 2.0),
                         // shadow direction: bottom right
                      )
                         ],
                     ),
    
                      ),
                      ),
                       Padding(padding: EdgeInsets.all(1),
                      child: Center(
                       child: Text("Mark",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),)
                    ],
                  ),
                )
                ,),
    
                 Padding(padding: EdgeInsets.all(1),
                child: Container(
                  width: 70,
                  height: 70,
                 
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(1),
                      child: Container(
                        height: 45,
                        width: 45,
                   decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40.0),
                         color: Colors.orange,
                         boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 3.0,
                          spreadRadius: 0.0,
                           offset: Offset(3.0, 2.0),
                         // shadow direction: bottom right
                      )
                         ],
                     ),
    
                      ),
                      ),
                       Padding(padding: EdgeInsets.all(1),
                      child: Center(
                       child: Text("Mary",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),),
    
                    ],
                  ),
                )
                ,),
              ],
            ),
          ),
          SizedBox(height:20),
      Container(
         
          width: 150,
          height: 60,
          decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40.0),
                         color: Colors.white,
                         boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 3.0,
                          spreadRadius: 0.0,
                           offset: Offset(3.0, 2.0),
                         // shadow direction: bottom right
                      )
                         ],
                     ),
          child: Padding(padding: EdgeInsets.all(3),
          child: Row(children: [
            Padding(padding: EdgeInsets.all(6),
            child: Container(
              width: 60,
              height: 50,
              decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(40.0),
                         color: Colors.white,
                         boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 3.0,
                          spreadRadius: 0.0,
                           offset: Offset(3.0, 2.0),
                         // shadow direction: bottom right
                      )
                         ],
                     ),
                     child: Center(
                      child: Text("Home",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                     ),
            ),
            ),
    
             Padding(padding: EdgeInsets.all(6),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsPage() ));
              },
              child: Container(
                width: 60,
                height: 50,
                decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(40.0),
                           color: Colors.green,
                           boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 3.0,
                            spreadRadius: 0.0,
                             offset: Offset(3.0, 2.0),
                           // shadow direction: bottom right
                        )
                           ],
                       ),
            
                         child: Center(
                        child: Text("Settings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                       ),
              ),
            ),
            ),
    
    
          ]),)
        ),
      
      ],
      ),
    ),
   

    );
  }
}