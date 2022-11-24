import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_moisture/core/components/app_bar_custom_painter.dart';
import 'package:soil_moisture/features/examine/presentation/bloc/recommed_crops_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class CropSearchBottomSheet extends StatefulWidget {
  const CropSearchBottomSheet({Key? key, required this.moisture}) : super(key: key);
  final String moisture;

  static void showDialog(BuildContext context, String moisture){
    context.read<RecommedCropsCubit>().filterBySoilMoisture(moisture);
    showModalBottomSheet(
      context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      builder: (context) {
        return BottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ),
          onClosing: (){}, 
          builder: (context) {
            return CropSearchBottomSheet(moisture: moisture,);
          },
        );
      },
    );
  }

  @override
  State<CropSearchBottomSheet> createState() => _CropSearchBottomSheetState();
}

class _CropSearchBottomSheetState extends State<CropSearchBottomSheet> {
 
  String selectedSoil = "";

  final soilList = const [
    "Red Sandy Soil",
    "Coastal Alluvial Soil",
    "Laterite Soil",
    "Red loamy Soil",
    "Red yellow soil",
  ];

  void wikiFunc(String query){
    const baseUrl = "https://en.wikipedia.org/wiki/";
    final url = baseUrl + query.toLowerCase().split(" ").join("_");
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 34,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: ((value) {
                      context.read<RecommedCropsCubit>().search(value);
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(238, 238, 238, 1)
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                      isCollapsed: true,
                      label: const Text(
                        "Search crop",
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.search),
                      )
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 80,
                  child: PopupMenuButton(
                    onSelected: (value) {
                      setState(() {
                        selectedSoil = value.toString();
                      });
                      context.read<RecommedCropsCubit>().filterBySoilType(value.toString());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color.fromRGBO(200, 200, 200, 1)
                        )
                      ),
                      child: Text(
                        selectedSoil.isEmpty? "Soil Type": selectedSoil,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(150, 150, 150, 1)
                        ),
                      ),
                    ),
                    itemBuilder: (context) {
                      return soilList.map((e) {
                        return PopupMenuItem(value: e,child: Text(e),);
                      }).toList();
                    },
                  )
                )
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const Text(
              "Result",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(163, 163, 163, 1)
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: BlocBuilder<RecommedCropsCubit, RecommedCropsState>(
                builder: (context, state) {
                  if(state is! RecommedCropsFilter){
                    return const SizedBox();
                  }
                  return ListView.builder(
                    itemCount: state.result.length,
                    shrinkWrap: true,
                    // primary: false,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          wikiFunc(state.result[index]);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/images/image1.png",
                                  height: 52,
                                  width: 52,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.result[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  const Text(
                                    "More info",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      );
  }
}