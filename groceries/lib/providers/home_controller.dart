import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var isVisible = true.obs;
   switchIcon() {
    isVisible.value = false;
    update();
  }
}
