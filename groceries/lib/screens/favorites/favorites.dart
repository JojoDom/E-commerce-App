import 'package:flutter/material.dart';
import 'package:groceries/global_variables/global_variables.dart';
import 'package:groceries/widgets/food_item_widget.dart';
import 'package:get/get.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('Favorites'),
       centerTitle: true,
       elevation: 0,
       backgroundColor: Colors.green,
       leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.arrow_back_ios)),
     ),
     body: Obx(() => 
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: favoritesController.favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: ((context, index) {
              return FoodItemWidget(
                foodData: favoritesController.favorites[index],
              );
            })),
         ),
     ),
    );
  }
}
