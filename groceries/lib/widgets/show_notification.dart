import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';


showNotification({String? title, String? body, String? route, String? image}) {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    barrierDismissible: true,
    
    content: SizedBox(
      height: 220,
      child: Column(
        children: [
          Text(title ?? ''),
          const SizedBox(
            height: 25,
          ),
          Text(body ?? ''),
          const SizedBox(height: 15),
          Flexible(child: CachedNetworkImage(imageUrl: image??'')),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {
                  Get.back();
                  Get.toNamed('/$route');
                },
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )),
          )
        ],
      ),
    ),
    title: "",
  );
}
