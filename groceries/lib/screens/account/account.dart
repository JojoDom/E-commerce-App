import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';



class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
   late Future<void> _initializeControllerFuture;
 

  @override
   void initState(){
    super.initState();
     WidgetsFlutterBinding.ensureInitialized();
      initializeCamera();
   
   
   }

    initializeCamera() async {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[0], ResolutionPreset.max,
        enableAudio: true);
          _initializeControllerFuture = cameraController.initialize();
    cameraController.lockCaptureOrientation();
    cameraController.setFlashMode(FlashMode.off);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ocr Test')),
      body: FutureBuilder<void>(
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
                            ),)

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
    final inputImage = InputImage.fromFile(File(imageCaptured.path));
    final textrecognizer = TextRecognizer();
    final RecognizedText recognizedText = await textrecognizer.processImage(inputImage);

    var blocks = recognizedText.blocks;
    var lines = recognizedText.text;
   Logger().i( ' Block length:${blocks.length}');
   Logger().i(lines);
   for(var line in blocks){
    Logger().i('Line is :: ${line.text}');
   }
   
    
  }

  
}




