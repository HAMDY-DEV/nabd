import 'package:image_picker/image_picker.dart';

class OpenCameraAndvideo {
  static Future<String?>? uploadImages() async {
    final pickedImag =
        await ImagePicker().pickImage(source: ImageSource.camera);

    return pickedImag?.path;
  }

  static Future<String?>? uploadImagesGallery() async {
    final pickedImag =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    return pickedImag?.path;
  }

  static Future<String?>? uploadVedio() async {
    final pickedImag =
        await ImagePicker().pickVideo(source: ImageSource.camera);

    return pickedImag?.path;
  }
}
