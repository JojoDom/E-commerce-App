import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/carousel_builder_modal.dart';
import '../../all_fruits_vegies.dart';
import '../../all_proteins.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
                              Get.to(const AllFruitsAndVegies(),
                                  transition: Transition.rightToLeft);
                            } else if (carouselData[index].title ==
                                'Proteins') {
                              Get.to(const AllProteins(),
                                  transition: Transition.rightToLeft);
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
                                      image:
                                          AssetImage(carouselData[index].image),
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
      ],
    );
  }
}
