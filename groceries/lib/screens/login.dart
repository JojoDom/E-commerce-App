import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/controllers/select_country_controller.dart';
import 'package:groceries/dashboard/dashboard.dart';
import 'package:groceries/widgets/country_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const CountryList());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                                          height: 30, width: 40,
                                          child: Obx(() => 
                                             CachedNetworkImage(
                        imageUrl: selectContry.imageUrl.value,
                        fit: BoxFit.contain,
                                            ),
                                          )),
                      ),
                      Obx(() =>  Text(selectContry.countryCode.value)),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: VerticalDivider(color: Colors.grey.shade300,),
                ),
                Obx(() => 
                   SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Center(
                          child: TextField(
                            maxLength: selectContry.maxlength.value,                           
                        decoration: InputDecoration(
                            hintText: 'XXX XXXX XXXX',
                           // counterText: '',
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            border: InputBorder.none),
                      ))),
                )
              ],
            ),
          ),
          Center(
            child: TextButton.icon(
                onPressed: () => Get.to(const Dashboard()),
                icon: const Icon(
                  Icons.login_outlined,
                  color: Colors.green,
                ),
                label: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
