import 'package:flutter/material.dart';
import 'package:groceries/models/food_model.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({Key? key, required this.foodsData})
      : super(key: key);

  final FoodsData foodsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            foodsData.title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Price\n"),
                    TextSpan(
                      text: '${foodsData.price}/${foodsData.measuringUnit}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Hero(
                tag: foodsData.title,
                child: Image.asset(
                  foodsData.image,
                  fit: BoxFit.fill,
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
