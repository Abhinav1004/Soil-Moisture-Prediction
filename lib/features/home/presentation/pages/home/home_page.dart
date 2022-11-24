import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_moisture/core/custom_icon/botton_nav_icons.dart';
import 'package:soil_moisture/core/components/app_bar_custom_painter.dart';
import 'package:soil_moisture/features/home/presentation/bloc/language_cubit.dart';
import 'package:soil_moisture/features/home/presentation/components/examine_crop_area.dart';
import 'package:soil_moisture/features/home/presentation/components/top_button_group.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: AppBarCustomPainter(),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  child: TopButtonGroup()
                ),
                Positioned(
                  right: 16,
                  top: 60,
                  child: IconButton(
                    color: Colors.white,
                    onPressed: (){
                      context.read<LanguageCubit>().changeLanguage();
                    }, 
                    icon: const Icon(Icons.translate)
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 31,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Examine your crops",
              style: TextStyle(
                color: Color.fromRGBO(82, 82, 82, 1),
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const ExamineCropArea(),
          const SizedBox(
            height: 18,
          ),
          _buildPsuedoText( "Gardens are not made by singing ‘Oh, how beautiful,’ and sitting in the shade. – Rudyard Kipling",),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: _buildPsuedoText("© Team The Hack Elite",),
          )
        ],
      ),
    );
  }

  Widget _buildPsuedoText(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromRGBO(182, 182, 182, 1),
          fontSize: 10,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}