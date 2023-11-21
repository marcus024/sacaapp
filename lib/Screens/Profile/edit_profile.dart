 
import 'package:flutter/material.dart';
import 'package:saca/FIREBASE_AUTH/firebaseauth.dart';
import 'package:saca/Screens/Profile/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saca/Screens/crops/list%20and%20add/update_student_page.dart';
import 'package:saca/Screens/crops/list and add/update_student_page.dart';
/*
class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}
*/

class EditProfilePage extends StatefulWidget {
  
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

      String? name = '';
      String? email = '';
      String? number = '';
      String? password = '';
      String? address = '';
       
  AuthController authController = AuthController();
  bool showPassword = false;

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
          email =snapshot.data()!["email"];
          number =snapshot.data()!["number"];
          password = snapshot.data()!["password"];
          address = snapshot.data()!["address"];
         
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
      appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
         ),
     backgroundColor: Color(0xff0e9229),
       title: const Text("Profile"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
              
             
        ),
        elevation: 0.00,
    ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
             
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Color(0xff0e9229)),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color(0xff0e9229),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),

Text(
  (name ?? "null"),
  style: const TextStyle(
    fontSize: 20.0,
    color:  Colors.black
  ),
),
Divider(),
Text(
  ("Name"),
  style: const TextStyle(
    fontSize: 12.0,
    color:  Color(0xff0e9229)
  ),
),

 SizedBox(
                height: 35,
              ),

Text(
  (email ?? "null"),
  style: const TextStyle(
    fontSize: 20.0,
    color:  Colors.black
  ),
),
Divider(),
Text(
  ("Email"),
  style: const TextStyle(
    fontSize: 12.0,
    color:  Color(0xff0e9229)
  ),
),

 SizedBox(
                height: 35,
              ),


Text(
  (number ?? "null"),
  style: const TextStyle(
    fontSize: 20.0,
    color:  Colors.black
  ),
),
Divider(),
Text(
  ("Mobile Number"),
  style: const TextStyle(
    fontSize: 12.0,
    color:  Color(0xff0e9229)
  ),
),


 SizedBox(
                height: 35,
              ),

Text(
  (password ?? "null"),
  style: const TextStyle(
    fontSize: 20.0,
    color:  Colors.black
  ),
),
Divider(),
Text(
  ("Password"),
  
  style: const TextStyle(
    fontSize: 12.0,
    color:  Color(0xff0e9229)
  ),
),


 SizedBox(
                height: 35,
              ),

Text(
  (address ?? "null"),
  style: const TextStyle(
    fontSize: 20.0,
    color:  Colors.black
  ),
),
Divider(),
Text(
  ("Address"),
  style: const TextStyle(
    fontSize: 12.0,
    color:  Color(0xff0e9229)
  ),
),



              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff0e9229),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )),

                    onPressed: () => UpdateStudentPage(id: '',),
                    child: Text("Edit",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Colors.white)),
                  ),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(primary: Color(0xff0e9229),
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                  
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 1,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}



