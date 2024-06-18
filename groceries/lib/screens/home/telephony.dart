import 'package:flutter/material.dart';
import 'ussd_service.dart';


class Telefony extends StatefulWidget {
  const Telefony({Key? key}) : super(key: key);

  @override
  _TelefonyState createState() => _TelefonyState();
}

class _TelefonyState extends State<Telefony> {
  final TextEditingController _ussdController = TextEditingController();
  final UssdService _ussdService = UssdService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USSD Request'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _ussdController,
              decoration: const InputDecoration(
                labelText: 'Enter USSD Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String ussdCode = _ussdController.text;
                if (ussdCode.isNotEmpty) {
                  if (!ussdCode.startsWith("*") || !ussdCode.endsWith("#")) {
                    ussdCode = "*$ussdCode#";
                  }
                  _ussdService.makeUssdRequest('*170#');
                }
              },
              child: Text('Send USSD Request'),
            ),
          ],
        ),
      ),
    );
  }
}
