import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:groceries/models/food_model.dart';
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
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 10,
                    right: 10,
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
                     Description(foodsData: widget.foodsData,),
                     const SizedBox(height:10),
                     QuantityAndPrice(foodsData: widget.foodsData,),
                     const SizedBox(height:10),
                    //   AddToCart(product: product)
                    ],
                  ),
                ),
              ProductTitleWithImage(foodsData: widget.foodsData)
              ],
            ),
          )
     ) );
  }
}
