import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:soil_moisture/features/home/domain/repository/image_input_repository.dart';

import '../../../../core/constants/enums.dart';

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

  showMsgGallery() async{
    emit(ImageInputShowingMsg(ImageInputEnum.gallery));
  }

  showMsgCamera() async{
    emit(ImageInputShowingMsg(ImageInputEnum.camera));
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
