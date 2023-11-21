import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  AddStudentPage({Key? key}) : super(key: key);

  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();

  var cropName = "";
  var type = "";
  var sName = "";
  var des = "";
  var ben = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final cropNameController = TextEditingController();
  final typeController = TextEditingController();
  final sNameController = TextEditingController();
  final desController = TextEditingController();
  final benController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cropNameController.dispose();
    typeController.dispose();
    sNameController.dispose();
    desController.dispose();
    benController.dispose();
    super.dispose();
  }
  
  clearText() {
    cropNameController.clear();
    typeController.clear();
    sNameController.clear();
    desController.clear();
    benController.clear();
  }

  // Adding Student
  CollectionReference students =
      FirebaseFirestore.instance.collection('crops');

  Future<void> addUser() {
    return students
        .add({'Crop Name': cropName, 'Type': type, 'Scientific Name': sName,'Description ' : des,'Benefits ' : ben})
        .then((value) => print('Crop Added'))
        .catchError((error) => print('Failed to Add crop: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Crop"),
        backgroundColor: Color(0xff0e9229),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              //crop cropName-----------------------------------
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                      width: 3, 
                      color: Color(0xff0e9229)),
    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff0e9229))),
                    labelText: 'Crop cropName ',
                    labelStyle: TextStyle(fontSize: 15.0,color: Color(0xff0e9229)),
                    errorStyle:
                        TextStyle(color: Color(0xff0e9229), fontSize: 15),
                  ),
                  controller: cropNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Crop cropName';
                    }
                    return null;
                  },
                ),
              ),

              //Type-------------------------
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                      width: 3, 
                      color: Color(0xff0e9229)),
    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff0e9229))),
                    labelText: 'Type ',
                    labelStyle: TextStyle(fontSize: 15.0,color: Color(0xff0e9229)),
                    errorStyle:
                        TextStyle(color: Color(0xff0e9229), fontSize: 15),
                  ),

                  controller: typeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Type';
                    }
                    return null;
                  },
                ),
              ),

              //Scientific cropName----------------------
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                   decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                      width: 3, 
                      color: Color(0xff0e9229)),
    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff0e9229))),
                    labelText: 'Scientific cropName ',
                    labelStyle: TextStyle(fontSize: 15.0,color: Color(0xff0e9229)),
                    errorStyle:
                        TextStyle(color: Color(0xff0e9229), fontSize: 15),
                  ),
                  controller: sNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Scientific cropName';
                    }
                    return null;
                  },
                ),
              ),
        //Description---------------------------
          Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                      width: 3, 
                      color: Color(0xff0e9229)),
    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff0e9229))),
                    labelText: 'Description ',
                    labelStyle: TextStyle(fontSize: 15.0,color: Color(0xff0e9229)),
                    errorStyle:
                        TextStyle(color: Color(0xff0e9229), fontSize: 15),
                  ),
                  controller: desController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                ),
              ),
    //Benefits---------------------------
          Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                      width: 3, 
                      color: Color(0xff0e9229)),
    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff0e9229))),
                    labelText: 'Benefits ',
                    labelStyle: TextStyle(fontSize: 15.0,color: Color(0xff0e9229)),
                    errorStyle:
                        TextStyle(color: Color(0xff0e9229), fontSize: 15),
                  ),
                  controller: benController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Benefits';
                    }
                    return null;
                  },
                ),
              ),



              //Button----------------------
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            cropName = cropNameController.text;
                            type = typeController.text;
                            sName = sNameController.text;
                            des = desController.text;
                            ben = benController.text;
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.green[700]),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0,color: Color(0xff0e9229)),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.green[50]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
