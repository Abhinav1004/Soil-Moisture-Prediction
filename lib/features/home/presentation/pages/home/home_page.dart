import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rice_disease_detect/features/home/presentation/components/app_bar_custom_painter.dart';
import 'package:rice_disease_detect/features/home/presentation/components/examine_crop_area.dart';
import 'package:rice_disease_detect/features/home/presentation/components/top_button_group.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(250, 250, 250, 1),
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
          const ExamineCropArea()
        ],
      ),
    );
  }
}