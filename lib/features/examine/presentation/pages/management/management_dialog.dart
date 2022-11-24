import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../../core/extension/string_extension.dart';

class ManagementDialog extends StatelessWidget {
  const ManagementDialog({Key? key, required this.moisture}) : super(key: key);
  final String moisture;

  static void showDialog(BuildContext context, String moisture){
    showGeneralDialog(
      context: context, 
      pageBuilder: (context, animation, secondaryAnimation) {
        return  Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28)
          ),
          child:  ManagementDialog(moisture: moisture,)
        );
      },
    );
  }

  final managements = const {
    "wet": [
      "Raising planting areas – by piling up soil into a ridge and furrow arrangement or by creating raised beds with sides – lifts the root zone up above the general ground level and, hopefully, any saturated conditions. Raised areas are also the first to drain through once the weather does dry out, and as a result they warm up slightly earlier in spring.",
      "When rainwater floods into the same area time and again, a little light geoengineering may be the solution. Use berms – mounds of soil – to hold back the water or divert it elsewhere."
    ],
    "dry": [
      "Mushroom Compost – helps to retain moisture while breaking down in the soil.",
      "apply a deep watering to the dry soil before applying ingredients. This will help to retain moisture in the lower levels of soil."
    ],
    "soaked": [
      "Raising planting areas – by piling up soil into a ridge and furrow arrangement or by creating raised beds with sides – lifts the root zone up above the general ground level and, hopefully, any saturated conditions. Raised areas are also the first to drain through once the weather does dry out, and as a result they warm up slightly earlier in spring.",
      "When rainwater floods into the same area time and again, a little light geoengineering may be the solution. Use berms – mounds of soil – to hold back the water or divert it elsewhere."
    ],
    "regular": [
      "Almost all crops grows on this. In case your farming rice, apply a deep watering to the dry soil before applying ingredients."
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 550
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 27,
          ),
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(12),
              color: const Color.fromRGBO(244, 244, 244, 1),
              child: Image.asset(
                "assets/icons/fluent-emoji-flat_test-tube.png",
                height: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            moisture.capitalize(),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(92, 92, 92, 1)
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                itemCount: managements[moisture.toLowerCase()]?.length??0,
                // primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 21),
                    child: Row(
                      children:  [
                        const Icon(
                          Icons.task_alt_sharp,
                          color: Color.fromRGBO(155, 155, 155, 1),
                        ),
                        const SizedBox(
                          width: 21,
                        ),
                        Expanded(
                          child: Text(
                            managements["dry"]?[index]??""
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
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
                "OKAY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}