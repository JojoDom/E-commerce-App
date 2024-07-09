import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries/main.dart';
import 'package:logger/logger.dart';

class MyUSSDService extends StatefulWidget {
  const MyUSSDService({Key? key}) : super(key: key);

  @override
  State<MyUSSDService> createState() => _MyUSSDServiceState();
}

class _MyUSSDServiceState extends State<MyUSSDService> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('USSD Test'),),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFormField(
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            child: ElevatedButton(
            onPressed: () async {
              Logger().i(controller.text);
              try {
              await platform.invokeMethod('sendUssd', {'ussdCode': controller.text}).then((value) => Logger().i(value));
              } on PlatformException catch (e) {
               debugPrint(e.message);
              }

            }, 
            child: const Text('Send Money', style: TextStyle(color: Colors.black),)),
          )

        ],),
      ),
    );
  }
}