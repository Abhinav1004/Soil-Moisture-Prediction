import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ManagementDialog extends StatelessWidget {
  const ManagementDialog({Key? key}) : super(key: key);

  static void showDialog(BuildContext context){
    showGeneralDialog(
      context: context, 
      pageBuilder: (context, animation, secondaryAnimation) {
        return  Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28)
          ),
          child: const ManagementDialog()
        );
      },
    );
  }

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
          const Text(
            "High Moisture",
            style: TextStyle(
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
                itemCount: 3,
                // primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 21),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.task_alt_sharp,
                          color: Color.fromRGBO(155, 155, 155, 1),
                        ),
                        SizedBox(
                          width: 21,
                        ),
                        Expanded(
                          child: Text(
                            "Drain out water and dry the field for 7-10 days"
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