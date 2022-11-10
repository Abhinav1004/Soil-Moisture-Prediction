import 'package:flutter/material.dart';

class ReadingItem extends StatelessWidget {
  const ReadingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Image.asset(
            "assets/images/image1.png",
            height: 54,
            width: 58,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Clay Soil",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "peferrable: Gum Dhan",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(108, 108, 108, 1)
                  ),
                )
              ],
            ),
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}