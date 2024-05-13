import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  //==================================> Gallery <===============================
  static Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      return File(returnImage.path).readAsBytesSync();
    }
  }

//==================================> Camera <===============================
  static Future pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage != null) {
      return File(returnImage.path).readAsBytesSync();
    }
  }
}
