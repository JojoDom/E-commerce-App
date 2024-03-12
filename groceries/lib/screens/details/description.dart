import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:groceries/models/food_model.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.foodsData}) : super(key: key);

  final FoodsData foodsData;
  

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Text(
       foodsData.description??'',
        style: const TextStyle(height: 1.5, color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14),
      ),
    );
  }
}
