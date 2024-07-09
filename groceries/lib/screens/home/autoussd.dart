import 'package:autoussdflutter/autoussdflutter.dart';
import 'package:flutter/material.dart';





class AutoUSSD extends StatefulWidget {
  const AutoUSSD({Key? key}) : super(key: key);

  @override
  _AutoUSSDState createState() => _AutoUSSDState();
}

class _AutoUSSDState extends State<AutoUSSD> {
  _AutoUSSDState() {
    // Initialize the SDK by passing a session execution callback
    // The native implementation works asynchronously we'll need
    // the callback to be notified of the session execution result
    AutoUssdFlutter.getInstance().registerSessionCountListener((count) {
      debugPrint("Session count: $count");
    });

    AutoUssdFlutter.getInstance().registerSessionResultListener((result) {
      debugPrint(result.status.toString());

      if (result.status == ResultStatus.COMPLETED) {
        Future.microtask(() {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  result.lastContent ?? "Please wait for a confirmation message",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"),
                  ),
                ],
              );
            },
          );
        });
      }
    });

    AutoUssdFlutter.getInstance().setOverlayTheme(
      OverlayThemeData(
        Color(0xfffebc43).value,
        Color(0xff333333).value,
        Color(0xff333333).value,
        Color(0xff333333).value,
        Colors.white.value,
        Color(0xff676767).value,
        Color(0xff333333).value,
        Color(0xff676767).value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AutoUssd Flutter Example App'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 300,
                child: Text(
                  "Flutter app demonstrating the use of the AutoUssd Flutter plugin",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 300,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 36,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Tap on the button to check the remaining balance on your ",
                                ),
                                TextSpan(
                                  text: "Vodafone Cash wallet",
                                  style: theme.textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    // Execute the session with this id
                    AutoUssdFlutter.getInstance().executeSession(
                      "629e05e1751c102d57c53c0d",
                      {
                        "number": "0507708982",
                        "amount": "1",
                        "reference": "PayBuddy Text",
                      },
                      null,
                      [
                        UssdDialogOverride(
                          ["Enter", "Pin"],
                          UssdDialogType.BUTTON,
                        ),
                      ],
                    );
                  },
                  child: const Text(
                    "Check Vodafone Momo Balance",
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    final networks = await AutoUssdFlutter.getInstance().getDeviceSimNetworks();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            networks.fold(
                              "${networks.length} ",
                              (accumulator, network) {
                                return "$accumulator, Network ${network.toMap()}";
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    "List Device Networks",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}