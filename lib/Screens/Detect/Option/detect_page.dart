import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:saca/Screens/Detect/Option/camera/camera_screen.dart';
import 'global_bindings.dart';

class detectMain  extends StatelessWidget{
const detectMain ( {Key? key}) : super (key: key);

@override
 Widget build(BuildContext context){
  return GetMaterialApp(
   debugShowCheckedModeBanner: false,
   home: CameraScreen(),
   title: "Camera App",
   initialBinding: GlobalBindings(),
  );
 }
}