/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saca/Screens/Detect/Option/scan_controller.dart';

class TopImageViewer extends GetView<ScanController>{
  const TopImageViewer ({Key? key}) : super (key : key);

  @override 

  Widget build(BuildContext context){
    return GetX(builder : (controller) => 
    Positioned(
      top: 50,
      child: Container(
        width: Get.width,
        height: 100,
        child: ListView.builder(
          itemCount: controller.imagelist.length,
          itemBuilder: (_, index){
              return SizedBox()
          }
          ),
      )
      )
    );

  }
}
*/