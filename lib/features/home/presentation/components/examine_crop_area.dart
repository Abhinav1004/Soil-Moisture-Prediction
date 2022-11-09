import 'package:flutter/material.dart';

class ExamineCropArea extends StatefulWidget {
  const ExamineCropArea({Key? key}) : super(key: key);

  @override
  State<ExamineCropArea> createState() => _ExamineCropAreaState();
}

class _ExamineCropAreaState extends State<ExamineCropArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    const Text(
                      "Take a picture",
                      style: TextStyle(
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
                    const Text(
                      "Get The result",
                      style: TextStyle(
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
                    const Text(
                      "Get diagnosis",
                      style: TextStyle(
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
                _buildButton("assets/icons/bi_camera-fill.png", "Take Photo"),
                const SizedBox(
                  width: 16,
                ),
                _buildButton("assets/icons/bi_file-earmark-image-fill.png", "Upload Photo")
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String image, String label){
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(249, 249, 249, 1),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: (){},
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