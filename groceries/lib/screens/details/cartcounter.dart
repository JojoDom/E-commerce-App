import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/screens/cart/cart_controller/cart_controller.dart';

class CartCounter extends ConsumerStatefulWidget {
  const CartCounter({
    Key? key,
    required this.foodsData,
  }) : super(key: key);
  final FoodsData foodsData;

   @override
  ConsumerState<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends ConsumerState<CartCounter> {
  void _incrementCounter() {
    setState(() {
      
      ref.read(numberOfItemsProv.notifier).update((state) => state+1);
      widget.foodsData.quantity = ref.read(numberOfItemsProv.notifier).state;
    });
  }

  // ignore: unused_element
  void _decrementCounter() {
    setState(() {
      ref.read(numberOfItemsProv.notifier).update((state) => state-1);
       widget.foodsData.quantity = ref.read(numberOfItemsProv);
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final quantity = ref.watch(numberOfItemsProv);
    return Row(
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: widget.foodsData.color,
          heroTag: null,
          onPressed: () {
            if (quantity > 1) {
              _decrementCounter();
            }
          },
          tooltip: 'remove',
          child: const Icon(Icons.remove),
        ),
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              // if our item is less  then 10 then  it shows 01 02 like that
              quantity.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        
        FloatingActionButton(
          backgroundColor: widget.foodsData.color,
          heroTag: null,
          onPressed: _incrementCounter,
          tooltip: 'add',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
