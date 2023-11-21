import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../scan_controller.dart';

class CameraViewer extends StatelessWidget {
  const CameraViewer ({Key? key}) : super (key: key);

  @override 
  Widget build(BuildContext context){
    return GetX<ScanController>(builder: (controller){
      if (!controller.isInitialized){
        return Container();
      }
        return SizedBox(
          width: Get.width,
          height: Get.height,
          child: CameraPreview(controller.cameraController));
    
    });
  }
  
}