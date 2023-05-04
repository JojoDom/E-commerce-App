import 'package:get/get.dart';

class CategoryController extends GetxController {
  var category = 'All'.obs;
  var isFavorite = false.obs;

  switchCategories(String categoryKey) {
    category.value = categoryKey;
    update();
  }
}
