import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/fruits_and_vegetables_data.dart';
import '../widgets/food_item_widget.dart';

class AllFruitsAndVegies extends StatefulWidget {
  const AllFruitsAndVegies({Key? key}) : super(key: key);

  @override
  State<AllFruitsAndVegies> createState() => _AllFruitsAndVegiesState();
}

class _AllFruitsAndVegiesState extends State<AllFruitsAndVegies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar( 
         flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                colors: [
                  Colors.green.shade200,
                  Colors.green.shade100,                 
                ]) ),
            ),
        title: const Text('Fruits & Vegies'),
        elevation: 0,
        leading: IconButton(onPressed: (() => Get.back()), icon: const Icon(Icons.arrow_back_ios)),
        ),
       body: Container(
         decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                colors: [
                  Colors.green.shade100,
                  Colors.white,
                  Colors.green.shade200,
                  Colors.white,
                  Colors.green.shade100,                 
                ]) ),
         margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
         child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: fruitsVegiesData.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: ((context, index) {
                      return FoodItemWidget(
                        fruitsVegiesData: fruitsVegiesData[index],
                      );
                    })),
       ),   
    );
  }
}