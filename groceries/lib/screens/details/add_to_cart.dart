import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_variables/global_variables.dart';
import '../../models/food_model.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key, required this.foodsData}) : super(key: key);

  final FoodsData foodsData;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity (Kg) :',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
              Obx(() => Text(
                    '${cartController.numofItems.value}kg',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price (GHS) :',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
              Obx(
                () => Text(
                  (cartController.numofItems.value * 1.5).toString() + 'GHS',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
         const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              if (widget.foodsData.favAndCart[1]) {
                        setState(() {
                         widget.foodsData.favAndCart[1] = false;
                        });
                        cartController.cart.removeWhere((element) =>
                            element.title == widget.foodsData.title);
                        cartController.update();
                      } else{
                        setState(() {
                        widget.foodsData.favAndCart[1] = true;
                      });
                      cartController.cart.add(widget.foodsData);
                      cartController.update();
                      }
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color:  widget.foodsData.color),
              child: Center(
                  child: Text(
                    widget.foodsData.favAndCart[1]?
                'Remove from Cart' : 'Add to Cart',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )),
            ),
          ),
        
        ],
      ),
    );
  }
}
