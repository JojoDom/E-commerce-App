import 'package:flutter/material.dart';
import 'package:groceries/models/food_model.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({Key? key, required this.foodsData}) : super(key: key);

  final FoodsData foodsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
