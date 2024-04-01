import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:groceries/providers/category_controller.dart';

class CategoriesWidget extends StatelessWidget {
  final String image;
  final String categoryName;
  final String categoryKey;
  const CategoriesWidget(
      {Key? key,
      required this.image,
      required this.categoryName,
      required this.categoryKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        final currentCategoryID = ref.watch(currentCategory);
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            ref.read(currentCategory.notifier).switchCategories(categoryKey);
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                      backgroundColor: categoryKey == currentCategoryID
                          ? Colors.yellow
                          : const Color(0xFFE3E3CD),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(image),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    categoryName,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                )
              ]),
        );
      }),
    );
  }
}
