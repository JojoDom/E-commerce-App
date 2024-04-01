// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:groceries/models/food_model.dart';
// import 'package:groceries/providers/food_provider.dart';

// class Helper{
//   changeCartValue(String category, WidgetRef ref, FoodsData foodData) {
//                     switch (category) {
//                       case 'Popular':
//                         ref.read(allFoods.notifier).isCart(foodData);
//                         break; 
//                         case 'FRUITS':
//                         ref.read(fruitsFoods.notifier).isCart(foodData);
//                         break; 
//                          case 'VEGGIES':
//                         ref.read(veggiesFoods.notifier).isCart(foodData);
//                         break;
//                          case 'FISH':
//                         ref.read(fishFoods.notifier).isCart(foodData);
//                         break; 
//                          case 'MEAT':
//                         ref.read(meatFoods.notifier).isCart(foodData);
//                         break; 
//                           case 'SEAFOOD':
//                         ref.read(seaFoods.notifier).isCart(foodData);
//                         break;
//                     }
//                     // cartController.cart.add(widget.foodData);
//                     // cartController.update();
//                   }
// }