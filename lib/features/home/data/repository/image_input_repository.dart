import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rice_disease_detect/core/error/exception.dart';
import 'package:rice_disease_detect/features/home/domain/repository/image_input_repository.dart';

class ImageInputRepositoryImp extends ImageInputRepository{
  final ImagePicker _picker = ImagePicker();

  @override
  Future<File> getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if(image==null){
      throw DataFetchingException("Cannot get image from camera");
    }
    final File imageFile = File(image.path);
    return imageFile;
  }

  @override
  Future<File> getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image==null){
      throw DataFetchingException("Cannot get image from gallery");
    }
    final File imageFile = File(image.path);
    return imageFile;
  }

}