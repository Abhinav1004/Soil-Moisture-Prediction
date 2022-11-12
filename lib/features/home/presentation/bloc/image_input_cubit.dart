import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rice_disease_detect/features/home/domain/repository/image_input_repository.dart';

part 'image_input_state.dart';

class ImageInputCubit extends Cubit<ImageInputState> {
  ImageInputRepository imageInputRepository;
  ImageInputCubit(this.imageInputRepository) : super(ImageInputInitial());

  getImageFromGallery() async {
    emit(ImageInputCapturing());
    try{
      File imageFile = await imageInputRepository.getImageFromGallery();
      emit(ImageInputCaptured(imageFile));
    }on Exception catch(err){
      emit(ImageInputError(err));
    }
  }

  getImageFromCamera() async {
    emit(ImageInputCapturing());
    try{
      File imageFile = await imageInputRepository.getImageFromCamera();
      emit(ImageInputCaptured(imageFile));
    }on Exception catch(err){
      emit(ImageInputError(err));
    }
  }
}
