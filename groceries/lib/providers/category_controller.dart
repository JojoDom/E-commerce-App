import 'package:flutter_riverpod/flutter_riverpod.dart';




class CategoryNotifier extends StateNotifier<String>{
  CategoryNotifier(String state) : super('Popular');
  void switchCategories(String categoryKey){
    state =categoryKey;
  } 
}

final currentCategory = StateNotifierProvider<CategoryNotifier, String>((ref) => CategoryNotifier('Popular'));
