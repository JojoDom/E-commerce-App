import 'package:logger/logger.dart';
import 'package:huawei_push/huawei_push.dart' as hms;

class HuaweiServices{
   void initPlatformstate() {
    Logger().i('HMS');
    hms.Push.getTokenStream.listen((event) {
      Logger().i('HMS');
      Logger().i('HMS $event');
    }).onData((data) {
      Logger().i(" Data $data");
    });
  }
}