import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceries/screens/search/ocr_provider/ocr_provider.dart';
import 'package:logger/logger.dart';

class OcrRrsponse extends StatefulWidget {
  const OcrRrsponse({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  State<OcrRrsponse> createState() => _OcrRrsponseState();
}

class _OcrRrsponseState extends State<OcrRrsponse> {
  final imageController = Get.put(ExtractImageController());

 @override
 void initState(){
  super.initState();
  imageController.extractImage('image', widget.image);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Extracted text')),
    body: Obx(() => 
    imageController.isFetching.isTrue? const Center(child:  CircularProgressIndicator(color: Colors.green)):
       
       
       ListView.separated(
      itemBuilder: ((context, index) {
         Map<String, dynamic> filterMap(Map<String, dynamic> map) {
  return map..removeWhere((key, value) => value == null);
}
        var stringText = imageController.extractedTexts[0].toString()
        .replaceAll("${imageController.extractedTexts[0]['textAnnotation']}", '')
         .replaceAll("${imageController.extractedTexts[0]["plainTextBase64"]}", '')
          .replaceAll("${imageController.extractedTexts[0]["categorizedUrl"]}", '')
          .replaceAll("${imageController.extractedTexts[0]["validationChecks"]}", '')
          .replaceAll("${imageController.extractedTexts[0]["status"]}", '')
     .replaceAll("${imageController.extractedTexts[0]["id"]}", '')
     .replaceAll("${imageController.extractedTexts[0]["pages"]}", '')
     .replaceAll("${imageController.extractedTexts[0]["type"]}", '')
      .replaceAll("${imageController.extractedTexts[0]["version"]}", '')
      .replaceAll("${imageController.extractedTexts[0]["lineItems"]}", '')
      .replaceAll("id", '')
      .replaceAll("type", '')
       .replaceAll("version", '')
       .replaceAll("pages", '')
        .replaceAll("validationChecks", '')
         .replaceAll("textAnnotation", '')
         .replaceAll("plainTextBase64", '')
         .replaceAll("categorizedUrl", '')
         .replaceAll("status", '')
          .replaceAll("lineItems", '')
         .replaceAll("validationChecks", '');

  //     Map<String, dynamic> dataMap = jsonDecode(stringText);
  //     Map<String, dynamic> filteredMap = filterMap(dataMap);
  //     List<MapEntry<String, dynamic>> keyValuePairs = filteredMap.entries.toList();
  //     for (var entry in keyValuePairs) {
  //   print('${entry.key}: ${entry.value}');
  // }
  
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(stringText)
        );
      }), 
      separatorBuilder: ((context, index) => const SizedBox(height: 5)), itemCount: imageController.extractedTexts.length),
    ),
    );
  }
}