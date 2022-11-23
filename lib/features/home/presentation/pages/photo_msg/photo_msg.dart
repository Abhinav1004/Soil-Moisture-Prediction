import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_moisture/features/home/presentation/bloc/image_input_cubit.dart';

import '../../../../../core/constants/enums.dart';

class PhotoMsgDialog extends StatelessWidget {
  const PhotoMsgDialog({Key? key, required this.type}) : super(key: key);
  final ImageInputEnum type;

  static void showDialog(BuildContext context, ImageInputEnum type){
    showGeneralDialog(
      context: context, 
      pageBuilder: (context, animation, secondaryAnimation) {
        return  Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28)
          ),
          child: PhotoMsgDialog(type: type,)
        );
      },
    );
  }

  final msg = const [
    "Dig the ground upto 2 inch",
    "There must not be any leaf or stone in the photo"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 550
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: const Color.fromRGBO(244, 244, 244, 1),
                    child: Image.asset(
                      "assets/icons/fluent-emoji-flat_test-tube.png",
                      height: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Text(
                    "Attention: While taking photo make sure:",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(92, 92, 92, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                itemCount: msg.length,
                primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 21),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.task_alt_sharp,
                          color: Color.fromRGBO(155, 155, 155, 1),
                        ),
                        const SizedBox(
                          width: 21,
                        ),
                        Expanded(
                          child: Text(
                            msg[index]
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: ElevatedButton(
              onPressed: (){
                switch (type) {
                  case ImageInputEnum.camera:
                    context.read<ImageInputCubit>().getImageFromCamera();
                    break;
                  case ImageInputEnum.gallery:
                    context.read<ImageInputCubit>().getImageFromGallery();
                    break;
                }
                // Navigator.of(context).pop();
              }, 
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  58
                ),
                primary: const Color.fromRGBO(228, 121, 121, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)
                ),
                elevation: 0
              ),
              child: const Text(
                "OKAY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600
                ),
              )
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}