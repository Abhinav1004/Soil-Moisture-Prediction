import 'package:flutter/material.dart';

class TopButtonGroup extends StatefulWidget {
  const TopButtonGroup({Key? key}) : super(key: key);

  @override
  State<TopButtonGroup> createState() => _TopButtonGroupState();
}

class _TopButtonGroupState extends State<TopButtonGroup> {

  void onSoilClick(){
    Navigator.of(context).pushNamed("/reading/soil");
  }

  void onPlantClick(){
    Navigator.of(context).pushNamed("/reading/plant");
  }

  void onPestClick(){
    Navigator.of(context).pushNamed("/reading/pest");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 134,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width-40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(158, 158, 158, 0.05),
            offset: Offset(0, 4),
            blurRadius: 4
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            _buildButton("assets/icons/noto_potted-plant.png", "Soil Type", onSoilClick),
            const VerticalDivider(
              width: 1,
            ),
            _buildButton("assets/icons/fluent-emoji_bug.png", "Soil Insect", onPestClick),
            const VerticalDivider(
              width: 1,
            ),
            _buildButton("assets/icons/noto_sheaf-of-rice.png", "Soil Plants", onPlantClick)
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String image, String label, VoidCallback onClick){
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 32,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}