import 'package:flutter/material.dart';

import '../../../../../core/components/app_bar_custom_painter.dart';

class ExaminePage extends StatelessWidget {
  const ExaminePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: AppBarCustomPainter(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 195,
                        width: MediaQuery.of(context).size.width-40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              offset: Offset(0, 4),
                              blurRadius: 4
                            )
                          ]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(23),
                          child: Image.asset(
                            "assets/images/image2.png",
                            height: 196,
                            width: MediaQuery.of(context).size.width-40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      const Text(
                        "Possible Disease",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 17),
                            child: Row(
                              children: [
                                Container(
                                  height: 53 * MediaQuery.of(context).textScaleFactor,
                                  width: 53 * MediaQuery.of(context).textScaleFactor,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(100)
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "98%",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(91, 91, 91, 1)
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                const Text(
                                  "Bacterial Blight",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(91, 91, 91, 1)
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      ElevatedButton(
                        onPressed: (){}, 
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(
                            double.infinity,
                            64
                          ),
                          primary: const Color.fromRGBO(228, 121, 121, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)
                          ),
                          elevation: 0
                        ),
                        child: const Text(
                          "Management",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      )
                    ],
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }
}