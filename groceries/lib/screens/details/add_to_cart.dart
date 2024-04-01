import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:groceries/screens/cart/cart_controller/cart_controller.dart';
import '../../models/food_model.dart';

class AddToCart extends ConsumerStatefulWidget {
  const AddToCart({Key? key, required this.foodsData}) : super(key: key);

  final FoodsData foodsData;

  @override
  ConsumerState<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends ConsumerState<AddToCart> {
  @override
  Widget build(BuildContext context) {
    final itemquantity = ref.watch(numberOfItemsProv);
    final cartCount = ref.watch(addToCart).length;
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
               Text(
                    '${itemquantity}kg',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  )
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
               Text(
                  '${ref.read(numberOfItemsProv) * 1.5}GHS',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              
            ],
          ),
         const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              if (widget.foodsData.favAndCart[1]) {
                        setState(() {
                         widget.foodsData.favAndCart[1] = false;
                        });
                       ref.read(addToCart).removeWhere((element) =>
                            element.title == widget.foodsData.title);
                      } else{
                        setState(() {
                        widget.foodsData.favAndCart[1] = true;
                      });
                      ref.read(addToCart.notifier).addToCart([widget.foodsData]);
                     
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
