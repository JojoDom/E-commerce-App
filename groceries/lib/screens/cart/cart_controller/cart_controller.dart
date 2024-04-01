import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries/models/food_model.dart';
import 'package:groceries/screens/cart/cart.dart';

// class CartController extends GetxController {
//   var cart = <FoodsData>[].obs;
//   var numofItems = 1.obs;
// }

final addToCart = StateNotifierProvider<CartController, List<FoodsData>>(
    (ref) => CartController([]));

class CartController extends StateNotifier<List<FoodsData>> {
  CartController(List<FoodsData> cart) : super([]);
  void addToCart(List<FoodsData> newItem) {
    state = newItem;
  }

  void removeFromCart(List<FoodsData> newItem){
    state = [];
  }
}


final numberOfItemsProv = StateProvider<int>((ref) => 1);