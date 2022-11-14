import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rice_disease_detect/features/reading/presentation/components/reading_item.dart';

import '../../../../../core/components/app_bar_custom_painter.dart';
import '../../bloc/selected_item/selected_item_reading_cubit.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedItemReadingCubit(),
      child: Scaffold(
          body: SizedBox(
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
                  padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(23)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
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
                                SizedBox(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    itemBuilder: (context, index) {
                                      return BlocBuilder<SelectedItemReadingCubit, SelectedItemReadingState>(
                                        builder: (context, state) {
                                          return ReadingItem(isSelected: state.at==index, index: index,);
                                        },
                                      );
                                    }, 
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        indent: 20,
                                      );
                                    }, 
                                    itemCount: 5
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            )
                          ), 
                          const SizedBox(
                            height: 30,
                          ),
                          _buildPsuedoText( "Gardens are not made by singing ‘Oh, how beautiful,’ and sitting in the shade. – Rudyard Kipling", context),
                          const SizedBox(
                            height: 18,
                          ),
                          Center(
                            child: _buildPsuedoText("© Team Somadhan", context),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildPsuedoText(String text, ctx){
    return SizedBox(
      width: MediaQuery.of(ctx).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromRGBO(182, 182, 182, 1),
            fontSize: 10,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}