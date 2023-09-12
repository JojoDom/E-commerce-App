import 'package:flutter/material.dart';
import 'package:groceries/models/food_model.dart';

import '../../widgets/food_item_widget.dart';

class Meats extends StatefulWidget {
  const Meats({Key? key}) : super(key: key);

  @override
  State<Meats> createState() => _MeatsState();
}

class _MeatsState extends State<Meats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: meats.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return FoodItemWidget(
              foodData: meats[index],
            );
          })),
    );
  }
}
