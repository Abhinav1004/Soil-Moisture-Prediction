import 'dart:io';

abstract class ImageInputRepository{
  Future<File> getImageFromGallery();
  Future<File> getImageFromCamera();
}