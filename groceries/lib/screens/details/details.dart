import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/screens/details/add_to_cart.dart';
import 'package:groceries/screens/details/product_title_with_image.dart';
import 'package:groceries/screens/details/quantity_and_price.dart';

import 'description.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.foodsData}) : super(key: key);

  final FoodsData foodsData;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    cartController.numofItems.value = widget.foodsData.quantity!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: widget.foodsData.color,
        appBar: AppBar(
          backgroundColor: widget.foodsData.color,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          elevation: 0,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    QuantityAndPrice(
                      foodsData: widget.foodsData,
                    ),
                    const SizedBox(height: 10),
                    Description(
                      foodsData: widget.foodsData,
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Flexible(child: AddToCart(foodsData: widget.foodsData,))
                  ],
                ),
              ),
              ProductTitleWithImage(foodsData: widget.foodsData)
            ],
              ),
            ),
          ],
        ));
  }
}
