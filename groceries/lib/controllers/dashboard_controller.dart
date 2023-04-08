import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var currentPageIndex = 0.obs;

  onPageChnaged(int index) {
    currentPageIndex.value = index;
    update();
  }
}
