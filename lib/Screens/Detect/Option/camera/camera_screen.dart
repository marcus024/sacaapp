import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:saca/Screens/Detect/Option/camera/camera_viewer.dart';
import 'package:saca/Screens/Detect/Option/scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraScreen extends GetView<ScanController> {
  const CameraScreen({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: const [
        CameraViewer(),
      ],
    );
  }
}