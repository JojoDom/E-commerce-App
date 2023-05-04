import 'package:flutter/material.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/widgets/food_item_widget.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('Cart'),
       centerTitle: true,
       elevation: 0,
       backgroundColor: Colors.green,
     ),
     body: Obx(() => 
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: cartController.cart.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: ((context, index) {
              return FoodItemWidget(
                foodData: cartController.cart[index],
              );
            })),
         ),
     ),
    );
  }
}
