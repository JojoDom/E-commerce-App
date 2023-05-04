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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(children: [
              Flexible(child: Image.asset(foodData.image)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(foodData.title, 
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18, 
                fontWeight: FontWeight.w400),),
              ),
              RichText(
            text: TextSpan(
              text: foodData.price,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18, 
              color: Colors.green,
              fontWeight: FontWeight.w500),
              children: <TextSpan>[
                TextSpan(
                  text: '/${foodData.measuringUnit}',
                  style: Theme.of(context).textTheme.bodySmall
                ),
               
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
            shape: BoxShape.circle,
            color: Colors.green
            ),
            child: const Icon(Icons.add,color: Colors.white,),
          ),
          replacement: Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red
            ),
            child: const Icon(Icons.add,color: Colors.white,),
          ),),
    ),
    const Positioned(
      bottom: 0,
      right: 0,
      child:Icon(Icons.favorite, color: Colors.yellow,)
)
          ],
        ),
      ),
    );
  }
}