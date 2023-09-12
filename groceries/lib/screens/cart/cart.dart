import 'package:flutter/material.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/screens/details/details.dart';
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
       centerTitle: false,
       elevation: 0,
       backgroundColor: Colors.green,
     ),
     body: Obx(() => 
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.separated(
          itemBuilder: ((context, index) =>
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              onTap: () => Get.to(Details(foodsData: cartController.cart[index])),
              title: Text(cartController.cart[index].title),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Quantity : ${cartController.cart[index].quantity}'),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.remove_circle, color: Colors.red,))
                ],
              ),
              trailing: Text('Subtotal : GHS ${(cartController.numofItems.value*1.5)}'),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: cartController.cart[index].color,
                backgroundImage: AssetImage(cartController.cart[index].image),),
            ),
          )
          ) ,
          separatorBuilder: ((context, index) => const SizedBox(height: 10,)), 
          itemCount: cartController.cart.length)
         ),
     ),
    );
  }
}
