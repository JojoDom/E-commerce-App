import 'package:flutter_riverpod/flutter_riverpod.dart';



class PageNotifier extends StateNotifier<int>{
  PageNotifier(int index) : super(0);
  void onPageChnaged(int index){
    state = index;
  }  
}

final page = StateNotifierProvider<PageNotifier, int>((ref) {return PageNotifier(0);});