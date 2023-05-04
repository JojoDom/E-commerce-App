import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/favorites_controller.dart';
import 'package:groceries/global_variables/global_variables.dart';

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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(children: [
              Flexible(child: Image.asset(widget.foodData.image)),
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
                replacement: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    if (widget.foodData.favorite[0]) {
                      setState(() {
                        widget.foodData.favorite[0] = false;
                      });
                    } else {
                      setState(() {
                        widget.foodData.favorite[0] = true;
                      });
                      favoritesController.favorites.add(widget.foodData);
                      favoritesController.update();
                    }
                  },
                  child: Icon(Icons.favorite,
                      color: widget.foodData.favorite[0] == false
                          ? Colors.grey
                          : Colors.yellow),
                ))
          ],
        ),
      ),
    );
  }
}
