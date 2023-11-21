import 'package:camera/camera.dart';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ScanController extends GetxController{

 final  RxBool _isInitialized = RxBool(false);
 late CameraController _cameraController;
 late List<CameraDescription> _cameras;
 late CameraImage _cameraImage;
 final RxList<Uint8List> _imageList = RxList([]);

 List<Uint8List> get imageList => _imageList;

  
bool get isInitialized => _isInitialized.value;
CameraController get cameraController => _cameraController;

Future<void> _initCamera() async{
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      _isInitialized.value = true;

_cameraController.startImageStream((image) => print(DateTime.now().millisecondsSinceEpoch))
;
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            print('User denied camera access');
            break;
          default:
            // Handle other errors here.
            print('Handle other errors');
            break;
        }
      }
    });
}


@override
 void onInit(){

_initCamera();
  super.onInit();
 }

void capture(){

img.Image image = img.Image.fromBytes(_cameraImage.width,
_cameraImage.height,
_cameraImage.planes[0].bytes, format: img.Format.bgra);

Uint8List jpeg = Uint8List.fromList(img.encodeJpg(image));
_imageList.add(jpeg);
_imageList.refresh();
print(jpeg.length);
print("Image Captured!");
}

}
