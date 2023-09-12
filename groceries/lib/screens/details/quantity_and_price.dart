import 'package:flutter/material.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/screens/details/cartcounter.dart';

import '../../global_variables/global_variables.dart';

class QuantityAndPrice extends StatefulWidget {
  const QuantityAndPrice({Key? key, required this.foodsData}) : super(key: key);

  final FoodsData foodsData;

  @override
  State<QuantityAndPrice> createState() => _QuantityAndPriceState();
}

class _QuantityAndPriceState extends State<QuantityAndPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       CartCounter(foodsData: widget.foodsData,),
      InkWell(
        onTap: () {
          if (widget.foodsData.favAndCart[0]) {
            setState(() {
              widget.foodsData.favAndCart[0] = false;
            });
            favoritesController.favorites.removeWhere(
                (element) => element.title == widget.foodsData.title);
            favoritesController.update();
          } else {
            setState(() {
              widget.foodsData.favAndCart[0] = true;
            });
            favoritesController.favorites.add(widget.foodsData);
            favoritesController.update();
          }
        },
        child: Icon(Icons.favorite, size: 45,
            color: widget.foodsData.favAndCart[0] == false
                ? Colors.grey
                : Colors.yellow),
      )
    ]);
  }
}
