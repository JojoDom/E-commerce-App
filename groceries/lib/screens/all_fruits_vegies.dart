import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../widgets/food_item_widget.dart';

class AllFruitsAndVegies extends StatefulWidget {
  const AllFruitsAndVegies({Key? key}) : super(key: key);

  @override
  State<AllFruitsAndVegies> createState() => _AllFruitsAndVegiesState();
}

class _AllFruitsAndVegiesState extends State<AllFruitsAndVegies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: fruitsVegiesData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return FoodItemWidget(
              foodData: fruitsVegiesData[index],
            );
          })),
    );
  }
}
