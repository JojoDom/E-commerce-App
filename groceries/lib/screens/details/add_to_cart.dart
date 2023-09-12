import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_variables/global_variables.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        ],
      ),
    );
  }
}
