import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:groceries/providers/kyc_provider.dart';
import 'package:groceries/screens/search/ocr_provider/ocr_provider.dart';
import 'package:groceries/screens/search/ocr_provider/response.dart';
import 'package:groceries/utilities/initializer.dart';
import 'package:logger/logger.dart';

class ExtractText extends StatefulWidget {
  const ExtractText({Key? key}) : super(key: key);

  @override
  State<ExtractText> createState() => _ExtractTextState();
}

class _ExtractTextState extends State<ExtractText> {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
   late Future<void> _initializeControllerFuture;
  var  imageController  = Get.put(ExtractImageController());

    @override
   void initState(){
    super.initState();
     initializeCamera();
     _initializeControllerFuture = cameraController.initialize();
     WidgetsFlutterBinding.ensureInitialized();
   }
   initializeCamera() async {
     cameraController = CameraController(
        Initializer.cameras[0], ResolutionPreset.max,
        enableAudio: true);   
    cameraController.lockCaptureOrientation();
    cameraController.setFlashMode(FlashMode.off);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extract Text')),
      body: 
        FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
           if(snapshot.connectionState == ConnectionState.done){
            return Stack(
              children: [
                 Positioned.fill(
                    child: CameraPreview(cameraController),
                  ),
                  ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcOut),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              backgroundBlendMode: BlendMode.dstOut),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Container(
                              height: 300,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: InkWell(
                              onTap: () {
                                _scanImage();
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 2.0)),
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                ),
                              ),
                            ),),

              ],
            );
           }else{
            return Center(
                child: Container(
                  height: 230,
                  decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      color: Color(0xFF808080),
                      size: 40,
                    ),
                  ),
                ),
              );
           }
        },
      )
      
    );
  }
  
   Future<void> _scanImage() async{
    final imageCaptured = await cameraController.takePicture(); 
    // ref.read(cardImageProvider.notifier).update((state) => imageCaptured);
    final imageBytes = File(imageCaptured.path).readAsBytesSync();
    String imgBase64 = base64Encode(imageBytes);
    Logger().i(imgBase64);
    Get.to( OcrRrsponse(image:imgBase64));
}
}