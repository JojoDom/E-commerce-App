import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/models/food_model.dart';

import '../widgets/food_item_widget.dart';

class AllProteins extends StatefulWidget {
  const AllProteins({Key? key}) : super(key: key);

  @override
  State<AllProteins> createState() => _AllProteinsState();
}

class _AllProteinsState extends State<AllProteins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Proteins'),
        elevation: 0,
        leading: IconButton(onPressed: (() => Get.back()), icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
        margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: meats.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: ((context, index) {
                      return FoodItemWidget(
                        foodData: meats[index],
                      );
                    })),  
        ),
    );
  }
}
