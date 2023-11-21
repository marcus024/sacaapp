import 'package:get/instance_manager.dart';
import 'package:saca/Screens/Detect/Option/scan_controller.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies(){
    //TODO : implement dependencies
    Get.lazyPut<ScanController>(() => ScanController());
  }
}