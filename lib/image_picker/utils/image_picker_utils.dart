import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  XFile? imageFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImageFromCamera() async {
    final XFile? imageFile =
        await _imagePicker.pickImage(source: ImageSource.camera);
    return imageFile;
  }

  Future<XFile?> pickImageFromGallery() async {
    final XFile? imageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    return imageFile;
  }
}
