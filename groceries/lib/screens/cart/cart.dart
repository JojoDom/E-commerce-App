import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/screens/cart/cart_controller/cart_controller.dart';
import 'package:groceries/screens/details/details.dart';
import 'package:groceries/widgets/food_item_widget.dart';
import 'package:get/get.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: 
         Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListView.separated(
                itemBuilder: ((context, index) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: () => Get.to(
                            Details(foodsData: ref.read(addToCart)[index])),
                        title: Text(ref.read(addToCart)[index].title),
                        subtitle: Text(
                            'Quantity : ${ref.read(addToCart)[index].quantity}'),
                        trailing: Column(
                          children: [
                            Text(
                                'Subtotal : GHS ${(ref.read(numberOfItemsProv) * 1.5)}'),
                            Flexible(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        ref
                                            .read(addToCart)[index]
                                            .favAndCart[1] = false;
                                      });
                                      ref.read(addToCart).removeWhere(
                                          (element) =>
                                              element.title ==
                                              ref.read(addToCart)[index].title);
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    )))
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: ref.read(addToCart)[index].color,
                          backgroundImage:
                              AssetImage(ref.read(addToCart)[index].image),
                        ),
                      ),
                    )),
                separatorBuilder: ((context, index) => const SizedBox(
                      height: 10,
                    )),
                itemCount: ref.read(addToCart).length)),
      
    );
  }
}
