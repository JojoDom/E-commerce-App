import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/home_controller.dart';
import 'package:groceries/models/categories_data.dart';
import 'package:groceries/screens/all_proteins.dart';
import 'package:groceries/screens/categories/fish.dart';
import 'package:groceries/screens/categories/fruits.dart';
import 'package:groceries/screens/categories/veggies.dart';
import 'package:groceries/screens/home/local_widgets/all_categories_widget.dart';
import 'package:groceries/theme/themes_controller.dart';
import '../../controllers/category_controller.dart';
import 'local_widgets/categories_widget.dart';

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
              title: Text('Hey'),
              subtitle: Text('Start shopping!'),
            ), 
            backgroundColor: Colors.green,           
            elevation: 0,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
              
              Obx(() =>  Expanded(                            
              child: categoryController.category.value == 'All'?
              const AllCategories(): 
              categoryController.category.value == 'FRUITS'?
              const Fruits():
              categoryController.category.value == 'VEGGIES'?
              const Veggies():
              categoryController.category.value == 'FISH'?
              const Fish():
              categoryController.category.value == 'BAKES'?
              const AllProteins():
              categoryController.category.value == 'MEAT'?
              const AllProteins():
              categoryController.category.value == 'SEAFOOD'?
              const AllProteins():
              categoryController.category.value == 'DIARY'?
              const AllProteins():
              categoryController.category.value == 'CEREALS'? 
              const AllProteins():              
              const SizedBox())
              )  
            ],
          )),
    );
  }
}

final categoryController = Get.put(CategoryController());
