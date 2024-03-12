import 'package:flutter/material.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/widgets/food_item_widget.dart';


class Fish extends StatefulWidget {
  const Fish({Key? key}) : super(key: key);

  @override
  State<Fish> createState() => _FishState();
}

class _FishState extends State<Fish> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: fish.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return FoodItemWidget(
              foodData: fish[index],
            );
          })),
    );
  }
}
