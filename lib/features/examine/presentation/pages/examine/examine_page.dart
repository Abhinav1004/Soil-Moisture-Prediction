import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_moisture/features/examine/presentation/bloc/examine_cubit.dart';
import 'package:soil_moisture/features/examine/presentation/pages/management/management_dialog.dart';

import '../../../../../core/components/app_bar_custom_painter.dart';

class ExaminePage extends StatelessWidget {
  const ExaminePage({Key? key, required this.imageFile}) : super(key: key);
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ExamineCubit()
        ..startExamine(imageFile),
      child: ExaminePageView(imageFile: imageFile),
    );
  }
}
class ExaminePageView extends StatelessWidget {
  const ExaminePageView({Key? key, required this.imageFile}) : super(key: key);
  final File imageFile;

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
                          child: Image.file(
                            imageFile,
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
                        "Possible Moisture",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      BlocBuilder<ExamineCubit, ExamineState>(
                        builder: (context, state) {
                          if(state is ExamineStarted){
                            return const CircularProgressIndicator();
                          }
                          var pred = (state as ExamineDone).moisture;
                          return Row(
                            children: [
                              Container(
                                height: 80 * MediaQuery.of(context).textScaleFactor,
                                width: 80 * MediaQuery.of(context).textScaleFactor,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  pred.label,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(91, 91, 91, 1)
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\"${pred.label}\" water concentration",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color:  Color.fromRGBO(91, 91, 91, 1)
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  // Text(
                                  //   "Danger, too much water concetration",
                                  //   style: const TextStyle(
                                  //     fontSize: 10,
                                  //     fontWeight: FontWeight.w500,
                                  //     color:  Color.fromRGBO(146, 0, 0, 1)
                                  //   ),
                                  // ),
                                  // LinearProgressIndicator(value: pred.confidence.toDouble(),)
                                  Builder(
                                    builder: (context) {
                                      Color color;
                                      Color txtColor;
                                      if(pred.confidence<30){
                                        color = Colors.red;
                                        txtColor = Colors.white;
                                      }else if(pred.confidence<70){
                                        color = Colors.yellow;
                                        txtColor = Colors.black;
                                      }else{
                                        color = Colors.green;
                                        txtColor = Colors.white;
                                      }
                                      return Container(
                                        // height: 18,
                                        width: (MediaQuery.of(context).size.width - ((80 * MediaQuery.of(context).textScaleFactor) + 20) - 40)*pred.confidence/100,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(pred.confidence.toDouble()/100),
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${pred.confidence.toStringAsFixed(2)}%",
                                            style: TextStyle(
                                              color: txtColor
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Was it helful?"
                          ),
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.thumb_up, color: Colors.green,)
                          ),
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.thumb_down, color: Colors.red,)
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      BlocBuilder<ExamineCubit, ExamineState>(
                        builder: (context, state) {
                          if(state is! ExamineDone){
                            return const SizedBox();
                          }
                          return ElevatedButton(
                            onPressed: state.moisture.label.toLowerCase()=="none"?null: (){
                              ManagementDialog.showDialog(context, state.moisture.label);
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
                              "Management",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600
                              ),
                            )
                          );
                        },
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