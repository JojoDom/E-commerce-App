import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/screens/details/details.dart';

import '../models/food_model.dart';

class FoodItemWidget extends StatefulWidget {
  const FoodItemWidget({
    Key? key,
    required this.foodData,
  }) : super(key: key);

  final FoodsData foodData;

  @override
  State<FoodItemWidget> createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cartController.numofItems.value = 1;
        Get.to(Details(foodsData: widget.foodData));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(children: [
                Flexible(
                    child: Hero(
                        tag: widget.foodData.title,
                        child: Image.asset(widget.foodData.image))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.foodData.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: widget.foodData.price,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: '/${widget.foodData.measuringUnit}',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ]),
              Positioned(
                top: 0,
                right: 0,
                child: Visibility(
                  visible: widget.foodData.favAndCart[1],
                  child: InkWell(
                    onTap: () {
                      if (widget.foodData.favAndCart[1]) {
                        setState(() {
                          widget.foodData.favAndCart[1] = false;
                        });
                        cartController.cart.removeWhere((element) =>
                            element.title == widget.foodData.title);
                        cartController.update();
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  replacement: InkWell(
                    onTap: () {
                      setState(() {
                        widget.foodData.favAndCart[1] = true;
                      });
                      cartController.cart.add(widget.foodData);
                      cartController.update();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      if (widget.foodData.favAndCart[0]) {
                        setState(() {
                          widget.foodData.favAndCart[0] = false;
                        });
                        favoritesController.favorites.removeWhere((element) =>
                            element.title == widget.foodData.title);
                        favoritesController.update();
                      } else {
                        setState(() {
                          widget.foodData.favAndCart[0] = true;
                        });
                        favoritesController.favorites.add(widget.foodData);
                        favoritesController.update();
                      }
                    },
                    child: Icon(Icons.favorite,
                        color: widget.foodData.favAndCart[0] == false
                            ? Colors.grey
                            : Colors.yellow),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
