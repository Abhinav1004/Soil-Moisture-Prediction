import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rice_disease_detect/features/reading/presentation/components/reading_item.dart';

import '../../../../../core/components/app_bar_custom_painter.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              height: 260,
              width: double.infinity,
              child: CustomPaint(
                painter: AppBarCustomPainter(),
              ),
            ),
            Positioned(
              top: 120,
              child: Column(
                children: [
                  Container(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/noto_potted-plant.png",
                                height: 32,
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              const Text(
                                "Soil Description",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const ReadingItem();
                          }, 
                          separatorBuilder: (context, index) {
                            return const Divider(
                              indent: 20,
                            );
                          }, 
                          itemCount: 3
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}