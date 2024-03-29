import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/home_controller.dart';
import 'package:groceries/models/categories_data.dart';
import 'package:groceries/screens/categories/meats.dart';
import 'package:groceries/screens/categories/fish.dart';
import 'package:groceries/screens/categories/fruits.dart';
import 'package:groceries/screens/categories/sea_food.dart';
import 'package:groceries/screens/categories/veggies.dart';
import 'package:groceries/screens/home/local_widgets/all_categories_widget.dart';
import 'package:groceries/theme/themes_controller.dart';
import '../../controllers/category_controller.dart';
import 'local_widgets/categories_widget.dart';
import 'package:huawei_push/huawei_push.dart' as hms;
import 'package:logger/logger.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final themeController = Get.find<ThemeController>();
  late HomeController homeController;
  bool _isVisible = true;

  void switchIcon() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }



  @override
  void initState() {
    homeController = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const ListTile(
              title: Text('Hey', style: TextStyle(color: Colors.white),),
              subtitle: Text('Start shopping!',style: TextStyle(color: Colors.white),),
            ), 
            backgroundColor: Colors.green,           
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                color: Colors.green,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(
                        'Categories',
                        textScaleFactor: 1.0,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                     Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) => CategoriesWidget(
                          image: categories[index].image,
                          categoryName: categories[index].categoryName,
                          categoryKey: categories[index].key)),
                      separatorBuilder: ((context, index) =>
                          const SizedBox(width: 20)),
                      itemCount: categories.length),
                ),                         
                  ],
                ),
              ),
             
              
              Obx(() =>  Expanded(                            
              child: categoryController.category.value == 'Popular'?
              const AllCategories(): 
              categoryController.category.value == 'FRUITS'?
              const Fruits():
              categoryController.category.value == 'VEGGIES'?
              const Veggies():
              categoryController.category.value == 'FISH'?
              const Fish():
              categoryController.category.value == 'MEAT'?
              const Meats():
              categoryController.category.value == 'SEAFOOD'?
              const SeaFood():            
              const SizedBox())
              )  
            ],
          )),
    );
  }
}

final categoryController = Get.put(CategoryController());
