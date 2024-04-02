import 'package:device_info_plus/device_info_plus.dart';
import 'package:groceries/utilities/firebase_service.dart';
import 'package:groceries/utilities/huawei_services.dart';
import 'package:logger/logger.dart';


Future<String?>getDeviceModel() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  Logger().i(androidInfo.model);
  return androidInfo.model;
}

setUpNotification() async {
  String? deviceModel = await getDeviceModel();
  if(deviceModel !=null && deviceModel.toLowerCase().contains('huawei')){
     FirebaseService().notificationSettings();
    HuaweiServices().initPlatformstate();
  }else{
  FirebaseService().notificationSettings();
  FirebaseService().getFirebaseToken();
  FirebaseService().setupInteractedMessage();
  }
}