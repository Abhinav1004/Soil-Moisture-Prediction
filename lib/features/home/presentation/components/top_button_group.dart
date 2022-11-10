import 'package:flutter/material.dart';

class TopButtonGroup extends StatelessWidget {
  const TopButtonGroup({Key? key}) : super(key: key);

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
            _buildButton("assets/icons/noto_potted-plant.png", "Soil Description", context),
            const VerticalDivider(
              width: 1,
            ),
            _buildButton("assets/icons/fluent-emoji_bug.png", "Rice Disease", context),
            const VerticalDivider(
              width: 1,
            ),
            _buildButton("assets/icons/noto_sheaf-of-rice.png", "Rice Description", context)
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String image, String label, BuildContext ctx){
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.of(ctx).pushNamed("/reading");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 32,
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