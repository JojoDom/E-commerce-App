
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardImageProvider = StateProvider<XFile?>((ref) => null);
final surNameProvider = StateProvider<String>((ref) => 'DD');
final  firstNameProvider = StateProvider<String>((ref) => 'AA');
final  dOBProvider = StateProvider<String>((ref) => 'aa');
final  docNumberProvider = StateProvider<String>((ref) => 'aa');
final  dateOfIssuanceProvider = StateProvider<String>((ref) => 'dd');
final  expiryProvider = StateProvider<String>((ref) => 'dd');
final cardIDProvider = StateProvider<String>((ref) => 'ee');
final sex = StateProvider<String>((ref) => 'ee');
final kycProgressProvider = StateProvider<int>((ref) => 0);
final imageFrontProvider = StateProvider<XFile?>((ref) => null);
final imageBackProvider = StateProvider<XFile?>((ref) => null);
final cardDetailsProvider = StateProvider<List<String>>((ref) => []);
