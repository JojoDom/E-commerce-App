import 'package:flutter/material.dart';
import 'package:groceries/models/food_model.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key, required this.foodsData,}) : super(key: key);
  final FoodsData foodsData;

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  void _incrementCounter() {
    setState(() {
      numOfItems++;
    });
  }

  // ignore: unused_element
  void _decrementCounter() {
    setState(() {
      numOfItems--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: widget.foodsData.color,
          heroTag: null,
          onPressed: () {
            if (numOfItems > 1) {
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
            numOfItems.toString().padLeft(2, "0"),
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
