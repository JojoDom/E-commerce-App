import 'package:get/get.dart';
import 'package:groceries/models/food_model.dart';

class CartController extends GetxController {
  var cart = <FoodsData>[].obs;
  var numofItems = 1.obs;
}
