import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:groceries/screens/search/data_model/ocr_fullmodel.dart';
import 'package:groceries/services/api_service.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/services.dart' show rootBundle;



class ExtractImageController extends GetxController{
  late ApiService apiService;
  var isFetching = false.obs;
  var extractedTexts = [].obs;
  var extractedStrings = ''.obs;
  
  final dio = Dio();

  @override
  Future<void> onInit() async {
    apiService = ApiService();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    super.onInit();
  }


  extractImage(String title, String image)async{
    isFetching(true);
    Map<String, dynamic> body ={
    "type": "xtract",
    "lang": "auto",
    "retain": "true",
    "files" : [
      {
        "title" : title,
        "src" : "data:image/jpeg;base64,$image"
      }
    ]
    };

    

    
    //await apiService.post(body).then((value) {
      try{
        String value = await rootBundle.loadString('assets/data.json');
       extractedTexts.value = jsonDecode(value);
       extractedStrings.value = extractedTexts.toString();

      extractedStrings
      .replaceAll("${extractedTexts[0]["textAnnotation"]}", '')
      .replaceAll("${extractedTexts[0]["plainTextBase64"]}", '')
     .replaceAll("${extractedTexts[0]["categorizedUrl"]}", '')
     .replaceAll("${extractedTexts[0]["validationChecks"]}", '')
     .replaceAll("${extractedTexts[0]["status"]}", '')
     .replaceAll("${extractedTexts[0]["id"]}", '')
     .replaceAll("${extractedTexts[0]["id"]}", '');

      
      // for (var element in extractedTexts) {
      //   element.remove('textAnnotation');
      //   element.remove('validationChecks');
      // //  element.remove('plainTextBase64');
      //   element.remove('categorizedUrl');
      //   element.remove('id');
      //   element.remove('type');
      //   element.remove('version');
      //   element.remove('pages');
      // }
       
      
       isFetching(false);

      }catch (error, stackTrace) {
         isFetching(false);
        update();
        Logger().e(error);
        Logger().i(stackTrace);
      }
    // }).onError((error, stackTrace) {
    //    isFetching(false);
    //   update();
    //   Logger().e(error);
    //   Logger().e(stackTrace);
    // });
   
  }

}