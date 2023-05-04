import 'package:flutter/material.dart';
import 'package:groceries/widgets/food_item_widget.dart';

import '../../models/food_model.dart';

class Veggies extends StatefulWidget {
  const Veggies({Key? key}) : super(key: key);

  @override
  State<Veggies> createState() => _VeggiesState();
}

class _VeggiesState extends State<Veggies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: veggies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return FoodItemWidget(
              foodData: veggies[index],
            );
          })),
    );
  }
}
