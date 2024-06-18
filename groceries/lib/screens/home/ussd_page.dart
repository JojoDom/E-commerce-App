import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/screens/home/my_ussd_advanced.dart';
import 'package:groceries/screens/home/telephony.dart';
import 'package:logger/logger.dart';
import 'package:ussd_service/ussd_service.dart';

class USSDRequest extends StatefulWidget {
  const USSDRequest({Key? key}) : super(key: key);

  @override
  State<USSDRequest> createState() => _USSDRequestState();
}

class _USSDRequestState extends State<USSDRequest> {
 final TextEditingController controller = TextEditingController();
  String? _response;

 makeMyRequest(String code) async {
  Logger().i(controller.text);
  int subscriptionId = 1; // sim card subscription ID
  try {
    String ussdResponseMessage = await UssdService.makeRequest(
        subscriptionId,
        '*170#',
       const  Duration(seconds: 10),
    );
    print("succes! message: $ussdResponseMessage");
  } catch(e) {
    debugPrint("error! code: ${e} - message: $e");
  }
}


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('USSD Service')),
      body:  Column(children: [
         TextFormField(controller: controller,),
        ElevatedButton(
        onPressed: ()async{
          await makeMyRequest(controller.text);
        }, 
        child: const Text('Make request',style: TextStyle(color: Colors.black),)),
            ElevatedButton(
                onPressed: () {
                  UssdAdvanced.sendUssd(
                      code: controller.text, subscriptionId: 1);
                },
                child: const Text('normal\nrequest',style: TextStyle(color: Colors.black)),
              ),
              ////SINGLE SESSION REQUEST
              ElevatedButton(
                onPressed: () async {
                  String? res = await UssdAdvanced.sendAdvancedUssd(
                      code: controller.text, subscriptionId: 1);
                  setState(() {
                    _response = res;
                  });
                },
                child: const Text('single session\nrequest',style: TextStyle(color: Colors.black)),
              ),
              /// MULTI SESSION REQUEST
              ElevatedButton(
                onPressed: () async {
                  String? res = await UssdAdvanced.multisessionUssd(
                      code: controller.text, subscriptionId: 1);
                  setState(() {
                    _response = res;
                  });
                  String? res2 = await UssdAdvanced.sendMessage('1');
                  setState(() {
                    _response = res2;
                  });
                  await UssdAdvanced.cancelSession();
                },
                child: const Text('multi session\nrequest',style: TextStyle(color: Colors.black)),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(onPressed: (){
                  Get.to(const Telefony());
                }, child: Text('Go to Telephony')),
              )
      
      ]),
    );
  }
}