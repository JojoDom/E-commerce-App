import 'package:flutter/material.dart';
import '../../../models/food_model.dart';
import '../../../widgets/food_item_widget.dart';


class AllCategories extends StatefulWidget {
  const AllCategories(this.foodItem, {Key? key}) : super(key: key);

  final List<FoodsData> foodItem;
  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.foodItem.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: ((context, index) {
            return FoodItemWidget(
              foodData: widget.foodItem[index],
            );
          })),
    );
  }
}
