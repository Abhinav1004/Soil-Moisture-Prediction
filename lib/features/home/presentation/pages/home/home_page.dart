import 'package:flutter/material.dart';
import 'package:rice_disease_detect/core/custom_icon/botton_nav_icons.dart';
import 'package:rice_disease_detect/features/home/presentation/components/app_bar_custom_painter.dart';
import 'package:rice_disease_detect/features/home/presentation/components/examine_crop_area.dart';
import 'package:rice_disease_detect/features/home/presentation/components/top_button_group.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromRGBO(228, 121, 121, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(BottomNavIcons.akar_icons_home_alt1),
            label: "home"
          ),
          BottomNavigationBarItem(
            icon: Icon(BottomNavIcons.fluent_calendar_info_16_regular),
            label: "Info"
          ),
          BottomNavigationBarItem(
            icon: Icon(BottomNavIcons.carbon_settings_adjust),
            label: "Settings"
          )
        ]
      ),
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
          const ExamineCropArea(),
          const SizedBox(
            height: 18,
          ),
          _buildPsuedoText( "Gardens are not made by singing ‘Oh, how beautiful,’ and sitting in the shade. – Rudyard Kipling",),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: _buildPsuedoText("© Team Somadhan",),
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