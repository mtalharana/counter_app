import 'package:bloc/bloc.dart';
import 'package:counter_app/image_picker/ui/image_picker_screen.dart';
import 'package:counter_app/image_picker/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryImagePicker);
  }
  void _cameraCapture(
    CameraCapture event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? imageFile = await imagePickerUtils.pickImageFromCamera();
    emit(state.copyWith(imageFile: imageFile));
  }

  void _galleryImagePicker(
    GalleryImagePicker event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? imageFile = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(imageFile: imageFile));
  }
}
