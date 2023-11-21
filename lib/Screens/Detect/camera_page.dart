import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:file_picker/file_picker.dart';


class detectGallery extends StatefulWidget{
  @override
  _detectGalleryState createState() => _detectGalleryState();
}
class _detectGalleryState extends State<detectGallery>{
  late File pickedImage;
  bool isImageLoaded = false;
  late List _result; //Should be List data type
  String _confidence ="";
  String _name = "";
  String numbers ='';
  Null get path => null;
  


  //get image from gallery
  getImageFromGalley() async{
    dynamic tempStore = await ImagePicker().getImage(
      source: ImageSource.gallery
    );
    setState(() {
      pickedImage = File(tempStore?.path);
      isImageLoaded = true;
      });
  }
  loadMyModel() async {
    var resultant = await Tflite.loadModel(
      labels: "assets/labels.txt",
      model: "assets/pest.tflite");
      print("Result after loading model:$resultant");
  }
  applyModelOnImage(File file) async {
    dynamic res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      );
     
      setState(() {
         print(res);
        _result = res;//Error detected 
        String str = _result[0]['label'];
        _name = str.substring(2);
        _confidence = _result != null ? (_result[0]['confidence']*100.0).toString().substring(0,2) + "%" : "";
      });
  }
  @override
      void initState() {
        super.initState();
        loadMyModel();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pest Classification and Detection'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30),
            isImageLoaded
            ? Center(
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(pickedImage.path)),
                    fit: BoxFit.contain)),
              ),
            )
            :Container(),
            Text("Pest Name : $_name \n Confidence Level: $_confidence")
        ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImageFromGalley();
        },
        child: Icon(Icons.photo_album),
      ),
    );
  }
}