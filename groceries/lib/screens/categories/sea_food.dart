import 'package:flutter/material.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/widgets/food_item_widget.dart';


class SeaFood extends StatefulWidget {
  const SeaFood({Key? key}) : super(key: key);

  @override
  State<SeaFood> createState() => _SeaFoodState();
}

class _SeaFoodState extends State<SeaFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: seaFood.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return FoodItemWidget(
              foodData: seaFood[index],
            );
          })),
    );
  }
}
