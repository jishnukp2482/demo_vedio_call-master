import 'package:demo_vedio_call/presentation/manager/call_controller.dart';
import 'package:get/get.dart';

class CallControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallController());
  }
}
