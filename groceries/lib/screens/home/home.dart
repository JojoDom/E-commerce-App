import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/providers/category_controller.dart';
import 'package:groceries/providers/home_controller.dart';
import 'package:groceries/models/categories_data.dart';
import 'package:groceries/screens/home/local_widgets/all_categories_widget.dart';
import 'package:groceries/theme/themes_controller.dart';
import 'local_widgets/categories_widget.dart';
import 'package:huawei_push/huawei_push.dart' as hms;

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
              title: Text(
                'Hey',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Start shopping!',
                style: TextStyle(color: Colors.white),
              ),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(
                        'Categories',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
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
              Consumer(builder: ((context, ref, child) {
                final currentCategoryID = ref.watch(currentCategory);
                return Expanded(
                    child: currentCategoryID == 'Popular'
                        ? AllCategories(all)
                        : currentCategoryID == 'FRUITS'
                            ? AllCategories(fruits)
                            : currentCategoryID == 'VEGGIES'
                                ? AllCategories(veggies)
                                : currentCategoryID == 'FISH'
                                    ? AllCategories(fish)
                                    : currentCategoryID == 'MEAT'
                                        ? AllCategories(meats)
                                        : currentCategoryID == 'SEAFOOD'
                                            ? AllCategories(seaFood)
                                            : const SizedBox());
              }))
            ],
          )),
    );
  }
}
