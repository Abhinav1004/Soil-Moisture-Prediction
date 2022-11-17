import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_moisture/features/reading/data/models/reading_model.dart';
import 'package:soil_moisture/features/reading/presentation/bloc/selected_item/selected_item_reading_cubit.dart';

class ReadingItem extends StatelessWidget {
  const ReadingItem({Key? key, required this.isSelected, required this.index, required this.reading}) : super(key: key);
  final bool isSelected;
  final int index;
  final ReadingModel reading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(isSelected){
          context.read<SelectedItemReadingCubit>().deselect();
        }else{
          context.read<SelectedItemReadingCubit>().selectedAt(index);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    "assets/images/${reading.imageUrl}",
                    height: 54,
                    width: 58,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reading.title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        reading.subtitle,
                        style: const TextStyle(
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
            AnimatedCrossFade(
              alignment: Alignment.bottomCenter,
              crossFadeState: isSelected? CrossFadeState.showFirst: CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
              firstChild:  Column(
                children: [
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    reading.desc,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(71, 71, 71, 1)
                    ),
                  ),
                ],
              ),
              secondChild: const SizedBox(),
            )

            // AnimatedSwitcher(
            //   duration: const Duration(milliseconds: 300),
            //   reverseDuration: const Duration(milliseconds: 100),
            //   switchInCurve: Curves.easeInOutQuad,
            //   transitionBuilder: (child, animation) {
            //     return ClipRect(child: SizeTransition(sizeFactor: animation, child: child,));
            //   },
            //   child: isSelected? Column(
            //     children: const [
            //       SizedBox(
            //         height: 13,
            //       ),
            //       Text(
            //         "Chalk, or calcareous soil, is found over limestone beds and chalk deposits that are located deep underground. This type of soil is sticky and hard to work with when wet, and it can dry out very quickly in the summer. Chalk is also very alkaline, with a pH of 7.5 or more on average [source: BBC]. This high pH is caused by lack of moisture and high lime content, which can cause stunted growth in plants. Excess lime can also turn these plants yellow",
            //         style: TextStyle(
            //           fontSize: 10,
            //           color: Color.fromRGBO(71, 71, 71, 1)
            //         ),
            //       ),
            //     ],
            //   ): const SizedBox(),
            // )
          ],
        ),
      ),
    );
  }
}