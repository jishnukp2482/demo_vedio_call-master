import 'package:demo_vedio_call/presentation/manager/DocumentController.dart';
import 'package:get/get.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentController());
  }
}
