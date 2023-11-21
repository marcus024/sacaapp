import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saca/Screens/Cropsdatabase/home_screen.dart';
import 'package:saca/Screens/Detect/ImageLabelling/label.dart';
import 'package:saca/Screens/Detect/Option/detect_page.dart';
import 'package:saca/Screens/Detect/camera_page.dart';
import 'package:saca/Screens/Pests/pestScreen.dart';
import 'package:saca/Screens/Predict/Details/Predict_screen.dart';
import 'package:saca/Screens/Predict/components/investment.dart';
import 'package:saca/Screens/Predict/finalPredict.dart';
import 'package:saca/Screens/Profile/edit_profile.dart';
import 'package:saca/Screens/Profile/settings.dart';
import 'package:saca/Screens/Welcome/welcome_screen.dart';
import 'package:saca/Screens/crops/CropData.dart';
import 'package:saca/Screens/crops/list%20and%20add/home_page.dart';
import 'package:saca/Screens/crops/list%20and%20add/list_student_page.dart';
import 'package:saca/Screens/details/components/image_and_icons.dart';
import 'package:saca/Screens/home/home_screen.dart';
import 'package:saca/auth/home_page.dart';
import 'package:saca/Screens/Detect/finaldetect.dart';

void main() => runApp(MyAppp());

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SACA : Farmers Haven'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {

 String? name = '';

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

class _MyHomePageState extends State<MyHomePage> {
 String? name = '';
//Display User's Profile from firestore
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
      primary: false,
      appBar: EmptyAppBar(),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
                color: Color(0xff0e9229),
              ),
              Positioned(
                  bottom: 150,
                  left: -40,
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.yellowAccent[100]?.withOpacity(0.1)),
                  )),
              Positioned(
                  top: -120,
                  left: 100,
                  child: Container(
                    
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: Colors.yellowAccent[100]?.withOpacity(0.1)),
                  )),
              Positioned(
                  top: -50,
                  left: 0,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellowAccent[100]?.withOpacity(0.1)),
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        color: Colors.yellowAccent[100]?.withOpacity(0.1)),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Welcome to SACA ",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                       /* ElevatedButton(
                          child: Text(
                            "Active",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          onPressed: () {},
                         // elevation: 1.0,
                         // color: Colors.white,
                        ),*/
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: Text(
                     (name ?? "null"),
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                        elevation: 3.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'New Feature',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Monthly Subscription',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                 /* Text(
                                    '',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  )*/
                                ],
                              ),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  
                                  Text(
                                    'Php 50',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0e9229)),
                                  ),
                                 /* Text(
                                    '',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  )*/
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          getGridView(),
          SizedBox(height: 15 ),
          Divider(height: 10,),
         Text(
          "Trivias and Facts about Agriculture",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
           color: Color(0xff0e9229),),
       
         ),
         SizedBox(height: 10,),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text("     Philippines Farmers",style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
          ),
Container(
  margin: const EdgeInsets.symmetric(vertical : 5.0),
  padding: const EdgeInsets.all(15.0),
  decoration: const BoxDecoration(
    borderRadius:  BorderRadius.all(Radius.circular(30.0)),
    color: Color(0xff0e9229)
  ),
  child: Text('Juan Dela Cruz',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
    textAlign: TextAlign.center,),
),
 SizedBox(height: 2,),

Container(
  margin: const EdgeInsets.all(5.0),
  padding: const EdgeInsets.all(15.0),
  decoration: const BoxDecoration(
    borderRadius:  BorderRadius.all(Radius.circular(30.0)),
    color: Color(0xff0e9229)
  ),
  child: Text('Pedro Penduko',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
    textAlign: TextAlign.center,),
),
 SizedBox(height: 2,),

Container(
  margin: const EdgeInsets.all(5.0),
  padding: const EdgeInsets.all(15.0),
  decoration: const BoxDecoration(
    borderRadius:  BorderRadius.all(Radius.circular(30.0)),
    color: Color(0xff0e9229)
  ),
  child: Text('Peter Pan',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
    textAlign: TextAlign.center,),
),
 SizedBox(height: 2,),

Container(
  margin: const EdgeInsets.all(5.0),
  padding: const EdgeInsets.all(15.0),
  decoration: const BoxDecoration(
    borderRadius:  BorderRadius.all(Radius.circular(30.0)),
    color: Color(0xff0e9229)
  ),
  child: Text('Juan Tamad',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
    textAlign: TextAlign.center,),
),
 SizedBox(height: 5,),


        ],
      ),
    );
  }

  Widget getGridView() {

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      primary: false,
      childAspectRatio: (MediaQuery
          .of(context)
          .size
          .width - 60 / 2) / 280,
          
      children: <Widget>[
        InkWell(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Detect() ));
          },
        child : createTile(0,_selectedIndex,false, 'Detect', Colors.purple, Icons.search)
    ),
        InkWell(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Predict()) );
          },
        child : createTile(1,_selectedIndex,true, 'Predict', Colors.yellow, Icons.line_axis_outlined),
    ),
        InkWell(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>CropsGrid() ));
          },
        child : createTile(2,_selectedIndex,false, 'Crops', Colors.green, Icons.grass),
    ),
        InkWell(
         onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>PestGrid() ));
          },
       child: createTile(3,_selectedIndex,true, 'Pests', Colors.brown, Icons.bug_report),
        
        ),
        InkWell(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>EditProfilePage() ));
          },

        child : createTile(4,_selectedIndex,false, 'Profile', Colors.red, Icons.person),
        ),
        InkWell(
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsPage() ));
          },
        child : createTile(5,_selectedIndex,true, 'Settings', Colors.blue, Icons.settings),
        )
      ],
    );
  }
  int _selectedIndex = -1;
  Widget createTile(int index,int selectedIndex,bool isEven, String title, Color color, IconData icon) {

    return Padding(
      
      padding: EdgeInsets.only(
          left:  isEven?10:10, right: isEven?10:10, top: 10, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: (){
            setState(() {
              _selectedIndex = index;
            });
            
          },
          child: Material(
            elevation: 3.0,
            color: _selectedIndex==index?Color(0xff0e9229):Colors.white,
            borderRadius: BorderRadius.circular(50.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(icon,color: _selectedIndex==index?Colors.white:color),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex==index?Colors.white:Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:2.0),
                        child: Container(
                          height: 3.0,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: _selectedIndex==index?Colors.orange:color,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
