import 'package:flutter/material.dart';

import '../models/food_model.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({
    Key? key, required this.foodData,
  }) : super(key: key);

  final FoodsData foodData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Flexible(child: Image.asset(foodData.image)),
          Text(foodData.title),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(color: Colors.green.shade300, borderRadius: BorderRadius.circular(5)),
            child: Center(child: const Text('ADD TO CART', style: TextStyle(color: Colors.white),)),
            ),
          )
        ]),
      ),
    );
  }
}