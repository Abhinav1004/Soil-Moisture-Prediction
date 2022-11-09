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
            color: Color.fromRGBO(158, 158, 158, 0.2),
            offset: Offset(0, 4),
            blurRadius: 4
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/noto_potted-plant.png",
                    height: 32,
                  ),
                  const Text(
                    "Soil Description",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
            const VerticalDivider(
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/fluent-emoji_bug.png",
                    height: 32,
                  ),
                  const Text(
                    "Rice Disease",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
            const VerticalDivider(
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/icons/noto_sheaf-of-rice.png",
                    height: 32,
                  ),
                  const Text(
                    "Rice Description",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}