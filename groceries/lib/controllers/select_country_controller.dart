

import 'package:get/get.dart';

class SelectCountry extends GetxController{
  var countryCode = '+233'.obs;
  var maxlength = 9.obs;
  var imageUrl = 'https://res.cloudinary.com/dur6dnckf/image/upload/v1711933026/ghana_mo1rb5.png'.obs;
}


var selectContry = Get.put(SelectCountry());