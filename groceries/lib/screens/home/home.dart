import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/home_controller.dart';
import 'package:groceries/screens/all_fruits_vegies.dart';
import 'package:groceries/theme/themes_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../models/carousel_builder_modal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Obx(
                  () => TextFormField(
                    textAlign: TextAlign.center,
                    controller: homeController.searchController,
                    decoration: InputDecoration(
                      prefixIcon: Visibility(
                        visible: homeController.isVisible.value,
                        replacement: IconButton(
                            onPressed: () {
                              homeController.searchController.clear();
                              homeController.isVisible.value = true;
                            },
                            icon: const Icon(Icons.close)),
                        child: IconButton(
                            onPressed: () {
                              homeController.switchIcon();
                            },
                            icon: const Icon(Icons.search)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                      hintText: 'Search your daily fresh foods',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: ListView(
            children: [
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
                  autoPlay: true,
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
