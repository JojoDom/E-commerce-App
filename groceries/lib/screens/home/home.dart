import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/home_controller.dart';
import 'package:groceries/models/categories_data.dart';
import 'package:groceries/screens/all_fruits_vegies.dart';
import 'package:groceries/screens/all_proteins.dart';
import 'package:groceries/theme/themes_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../models/carousel_builder_modal.dart';

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
            elevation: 0,
            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(100),
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            //     child: Obx(
            //       () => TextFormField(
            //         textAlign: TextAlign.center,
            //         controller: homeController.searchController,
            //         decoration: InputDecoration(
            //           prefixIcon: Visibility(
            //             visible: homeController.isVisible.value,
            //             replacement: IconButton(
            //                 onPressed: () {
            //                   homeController.searchController.clear();
            //                   homeController.isVisible.value = true;
            //                 },
            //                 icon: const Icon(Icons.close)),
            //             child: IconButton(
            //                 onPressed: () {
            //                   homeController.switchIcon();
            //                 },
            //                 icon: const Icon(Icons.search)),
            //           ),
            //           contentPadding: const EdgeInsets.symmetric(horizontal: 2),
            //           focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: const BorderSide(color: Colors.green)),
            //           enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: BorderSide(
            //                 color: Colors.grey.shade300,
            //               )),
            //           hintText: 'Search your daily fresh foods',
            //           hintStyle: Theme.of(context)
            //               .textTheme
            //               .bodySmall!
            //               .copyWith(fontSize: 12),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          body: ListView(
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
                  separatorBuilder: ((context, index)=> const SizedBox(width: 20)), 
                  itemCount: categories.length),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Best Deals',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              CarouselSlider.builder(
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 4, right: 4),
                      child: Stack(children: [
                        Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(carouselData[index].image),
                                    fit: BoxFit.cover))),
                        Positioned.fill(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .25,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.black.withAlpha(80)),
                          ),
                        ),
                        Positioned(
                            bottom: 50,
                            left: 25,
                            child: Center(
                              child: Text(
                                carouselData[index].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        Positioned(
                            bottom: 25,
                            left: 25,
                            child: Center(
                                child: Text(
                              carouselData[index].subTitle,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )))
                      ]),
                    ),
                  );
                },
                itemCount: carouselData.length,
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  viewportFraction: .80,
                  pauseAutoPlayOnTouch: false,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          onTap: (() {
                            if (carouselData[index].title ==
                                'Fruits and Vegetables') {
                              Get.to(const AllFruitsAndVegies(),transition: Transition.rightToLeft);
                            }else if (carouselData[index].title == 'Proteins'){
                               Get.to(const AllProteins(),transition: Transition.rightToLeft);
                            }
                          }),
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          carouselData[index].image),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          title: Text(carouselData[index].title),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return const SizedBox(
                        width: 5,
                      );
                    }),
                    itemCount: carouselData.length),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Let us help you cook'),
              ),
              // Image.asset("assets/images/trans_orange.png")
            ],
          )),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  final String image;
  final String categoryName;
  final String categoryKey;
  const CategoriesWidget({
    Key? key, required this.image, required this.categoryName, required this.categoryKey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 227, 227, 205),
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(categoryName, 
          style: Theme.of(context).textTheme.bodySmall!
          .copyWith(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black),),
        )
    ]);
  }
}
