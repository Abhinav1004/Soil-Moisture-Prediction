import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_moisture/core/constants/enums.dart';
import 'package:soil_moisture/features/home/data/repository/image_input_repository.dart';
import 'package:soil_moisture/features/home/presentation/bloc/image_input_cubit.dart';
import 'package:soil_moisture/features/home/presentation/pages/photo_msg/photo_msg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExamineCropArea extends StatelessWidget {
  const ExamineCropArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExamineCropAreaView();
  }
}

class ExamineCropAreaView extends StatefulWidget {
  const ExamineCropAreaView({Key? key}) : super(key: key);

  @override
  State<ExamineCropAreaView> createState() => _ExamineCropAreaViewState();
}

class _ExamineCropAreaViewState extends State<ExamineCropAreaView> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return BlocListener<ImageInputCubit, ImageInputState>(
      listener: (context, state) {
        if(state is ImageInputCaptured){
          Navigator.of(context).pushNamed(
            "/examine",
            arguments: state.imageFile
          );
        }else if(state is ImageInputShowingMsg){
          PhotoMsgDialog.showDialog(context, state.type);
        }else if(state is ImageInputCapturing){
          Navigator.of(context).maybePop();
        }
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 11),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/icons/scan_ico.png",
                          height: 58,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          locale.take_a_picture,
                          style: const TextStyle(
                            color: Color.fromRGBO(91, 91, 91, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const Icon(Icons.chevron_right),
                    Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Image.asset(
                          "assets/icons/mobile_ico.png",
                          height: 51,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          locale.get_the_result,
                          style: const TextStyle(
                            color: Color.fromRGBO(91, 91, 91, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const Icon(Icons.chevron_right),
                    Column(
                      children: [
                        Image.asset(
                          "assets/icons/fluent-emoji_health-worker.png",
                          height: 54,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          locale.get_diagnosis,
                          style: const TextStyle(
                            color: Color.fromRGBO(91, 91, 91, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    _buildButton("assets/icons/bi_camera-fill.png", locale.take_photo, ImageInputEnum.camera),
                    const SizedBox(
                      width: 16,
                    ),
                    _buildButton("assets/icons/bi_file-earmark-image-fill.png", locale.upload_photo, ImageInputEnum.gallery)
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildButton(String image, String label, ImageInputEnum type){
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(249, 249, 249, 1),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: (){
            switch (type) {
              case ImageInputEnum.camera:
                context.read<ImageInputCubit>().showMsgCamera();
                break;
              case ImageInputEnum.gallery:
                context.read<ImageInputCubit>().showMsgGallery();
                break;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            height: 105,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 26,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}