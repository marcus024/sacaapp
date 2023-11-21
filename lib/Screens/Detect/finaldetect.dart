import 'dart:io';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Detect extends StatefulWidget {

  const Detect({Key? key}) : super(key: key);
@override
_DetectpageState createState() => _DetectpageState();

}
class _DetectpageState extends State<Detect>{

//New Edit Variables
  late bool _loading;
  late File imageFile;
  // ignore: prefer_typing_uninitialized_variables
  var _outputs; //to store the output of the model in a list.
  final _imagePicker = ImagePicker();
  

//Initialization
  @override
  void initState(){
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

// Load Model
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/pest.tflite",
      labels: "assets/labels.txt",);
  }
//New Edit
// Get from Camera
// void _getFromCamera() async {

//   XFile? pickedFile = await _imagePicker.pickImage(
//       source: ImageSource.camera,
//       maxHeight: 1080,
//       maxWidth: 1080,
//   );
//   setState(() {
//     imageFile = File(pickedFile!.path);
//   });
//   Navigator.pop(context);
// }

/// Get from gallery
_getFromGallery() async {
    var pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
    );
    //New Edit
    
    setState(() {
      if (pickedFile == null){
        return null;
      }
      else if(pickedFile != null){
      _loading = true;
     File imageFile = File(pickedFile.path);
     }//New edit
    });
    classifyImage(imageFile);
    //New Edit
    // if (pickedFile != null) {  --Last Edit to be undo
    //     File imageFile = File(pickedFile.path);
    // }
}

//New Edit
  classifyImage(File pickedFile) async {
    var output = await Tflite.runModelOnImage(
      path: pickedFile.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _loading = false;
      _outputs = output;
    });
  }
// New Edit
  @override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
         ),
     backgroundColor: Color(0xff0e9229),
       title: const Text("Detect Pest"),
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
    body: //New Edit
    _loading
        ? Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    )
        : Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageFile == null
              ? Container()
              : Container(
            child: Image.file(imageFile),
            height: 500,
            width: MediaQuery.of(context).size.width-200,
          ),
          SizedBox(height: 20,),
          _outputs != null
              ? Text (
            "${_outputs[0]["label"]}".replaceAll(RegExp(r'[0-9]'),''),
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                background: Paint()..color = Colors.white,
                fontWeight: FontWeight.bold),
          )
              : Text("Classification Waiting")

        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _getFromGallery,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
          //New Edit
 //    ListView(
 //      children: <Widget> [
 //        SizedBox(height: 300,),
 //       Column(
 // children: [
 //    SizedBox(
 //      height: 50,
 //    ),
 //    ElevatedButton.icon(   // <-- ElevatedButton
 //      onPressed: () {
 //        _getFromGallery();
 //      },
 //      style: ElevatedButton.styleFrom(
 //      primary: Color(0xff0e9229)
 //      ),
 //      icon: Icon(
 //        Icons.photo_album_outlined,
 //        size: 24.0,
 //        color: Colors.white,
 //      ),
 //      label: Text('Gallery'),
 //    ),
 //
 //  ElevatedButton.icon(   // <-- ElevatedButton
 //      onPressed: () {
 //        _getFromCamera();
 //      },
 //      style: ElevatedButton.styleFrom(
 //      primary: Color(0xff0e9229)
 //      ),
 //      icon: Icon(
 //        Icons.camera_alt_rounded,
 //        size: 24.0,
 //        color: Colors.white,
 //      ),
 //      label: Text('Capture'),
 //    ),
 //
 //  ],
 //      ),
 //      ],
 //    ), // Last Edit-To Be Undo
  );
}

}