import 'dart:math';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/DocumentModel.dart';

class DocumentController extends GetxController {
  var panCardimage = Rxn<XFile>();
  var profileimage = Rxn<XFile>();
  var signatureimage = Rxn<XFile>();
  final pancardpicker = ImagePicker();
  final profilepicker = ImagePicker();
  final signaturepicker = ImagePicker();

  Future getpancardimage() async {
    final pancardpickedfile =
        await pancardpicker.pickImage(source: ImageSource.camera);
    if (pancardpickedfile != null) {
      panCardimage.value = pancardpickedfile;
      documentlist.firstWhere((element) => element.id == 0).image =
          pancardpickedfile.path;
      documentlist.refresh();
    } else {
      print("No PanCardimage selected");
    }
  }

  getprofileimage() async {
    final profilepickedfile =
        await profilepicker.pickImage(source: ImageSource.camera);
    if (profilepickedfile != null) {
      panCardimage.value = profilepickedfile;
      documentlist.firstWhere((element) => element.id == 1).image =
          profilepickedfile.path;
      documentlist.refresh();
    } else {
      print("No profile selected");
    }
  }

  Future getsignatureimage() async {
    final signaturepickedfile =
        await signaturepicker.pickImage(source: ImageSource.camera);
    if (signaturepickedfile != null) {
      panCardimage.value = signaturepickedfile;
      documentlist.firstWhere((element) => element.id == 2).image =
          signaturepickedfile.path;
      documentlist.refresh();
    } else {
      print("No signature selected");
    }
  }

  var documentlist = <DocuMentModel>[].obs;
  @override
  void onInit() {
    documentlist.addAll([
      DocuMentModel(
          id: 0,
          image: "assets/pancard.webp",
          ontap: () {
            getpancardimage();
          },
          title: "Original PAN Card"),
      DocuMentModel(
          id: 1,
          image: "assets/profile.jpg",
          ontap: () {
            getprofileimage();
          },
          title: "Profile Picture (Selfie)"),
      DocuMentModel(
          id: 2,
          image: "assets/signature.jpg",
          ontap: () {
            getsignatureimage();
          },
          title: "Signature"),
    ]);
    super.onInit();
  }
}
