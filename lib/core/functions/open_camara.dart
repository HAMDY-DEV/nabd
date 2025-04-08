import 'package:image_picker/image_picker.dart';

class OpenCameraAndvideo {
  static uploadImages() async {
    final pickedImag =
        await ImagePicker().pickImage(source: ImageSource.camera);

    return pickedImag?.path;
  }

  static uploadImagesGallery() async {
    final pickedImag =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    return pickedImag?.path;
  }

  static uploadVedio() async {
    final pickedImag =
        await ImagePicker().pickVideo(source: ImageSource.camera);

    return pickedImag?.path;
  }
}
