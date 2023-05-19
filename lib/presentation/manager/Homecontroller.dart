import 'package:get/get.dart';
import 'package:location/location.dart';

import '../routes/app_Pages.dart';

class HomeController extends GetxController {
  Location location = Location();
  final locationEnabled = false.obs;
  late LocationData currentLocation;
  String LocationMessage = '';
  checkpermission() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        LocationMessage = 'Location services are disabled.';
        return;
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        LocationMessage = 'Location permissions are denied.';
        return;
      }
    }
    if (permissionStatus == PermissionStatus.granted) {
      locationEnabled.value = true;
      LocationMessage = 'Location permissions are granted.';
      Get.toNamed(AppPages.uploadDocuments);
      location.onLocationChanged.listen((LocationData _currentLocation) {
        currentLocation = _currentLocation;
      });
    }
  }
}
