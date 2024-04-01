import 'package:flutter_riverpod/flutter_riverpod.dart';



class CountryModel {
  final String countryCode;
  final String imageUrl;
  final int maxlength;

  CountryModel(this.countryCode, this.imageUrl, this.maxlength);
}

final countryListProvider = StateProvider<CountryModel>((ref) {
  return CountryModel(
      '+233',
      'https://res.cloudinary.com/dur6dnckf/image/upload/v1711933026/ghana_mo1rb5.png',
      9);
});
