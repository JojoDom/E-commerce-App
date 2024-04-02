import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/screens/cart/cart.dart';
import 'package:logger/logger.dart';

// class CartController extends GetxController {
//   var cart = <FoodsData>[].obs;
//   var numofItems = 1.obs;
// }

final addToCart = StateNotifierProvider<CartController, List<FoodsData>>(
    (ref) => CartController([]));

class CartController extends StateNotifier<List<FoodsData>> {
  CartController(List<FoodsData> cart) : super([]);
 
  void addToCart(FoodsData foodsData) => state = [...state, foodsData];

}


final numberOfItemsProv = StateProvider<int>((ref) => 1);

final cartCountProvider = StateProvider<int>((ref) => 0);