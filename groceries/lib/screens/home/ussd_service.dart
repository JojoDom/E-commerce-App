import 'package:telephony/telephony.dart';

class UssdService {
  final Telephony telephony = Telephony.instance;

  Future<void> makeUssdRequest(String ussdCode) async {
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    if (permissionsGranted == true) {
      await telephony.dialPhoneNumber(ussdCode);
    }
  }
}
