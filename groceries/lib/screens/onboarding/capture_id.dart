import 'dart:io';
import 'package:groceries/utilities/ocr_text_extraction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:groceries/providers/kyc_provider.dart';
import 'package:groceries/screens/account/verify_account_details.dart';
import 'package:groceries/utilities/initializer.dart';
import 'package:logger/logger.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';



class CaptureID extends ConsumerStatefulWidget {
  const CaptureID({Key? key}) : super(key: key);
  @override
  ConsumerState<CaptureID> createState() => _AccountState();
}

class _AccountState extends ConsumerState<CaptureID> {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
   late Future<void> _initializeControllerFuture;

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
    final kycProgress = ref.watch(kycProgressProvider);
    final imageFront = ref.watch(imageFrontProvider);
    final imageBack = ref.watch(imageBackProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Ocr Test')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
           if(snapshot.connectionState == ConnectionState.done){
            return Stack(
              children: [
                Positioned(
                  top: 0,
                    left: 0,
                    right: 0,
                  child: Text(
                    imageFront == null && imageBack == null? 'ID Front' : imageFront != null && imageBack == null? 'ID Back' : '',
                    style: const TextStyle(color: Colors.white),
                    )),
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
                                _scanImage(ref, context);
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

                            Positioned(
                      left: 20,
                      bottom: 27,
                      child: InkWell(
                        onTap: () {
                          _pickImage();
                        },
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(Icons.image,color: Colors.white,)),
                      ))

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
  
  Future<void> _scanImage(WidgetRef ref, BuildContext context) async{
    final imageFront = ref.watch(imageFrontProvider);
    final imageBack = ref.watch(imageBackProvider);
    if(imageFront == null && imageBack == null){
    final imageCaptured = await cameraController.takePicture(); 
    ref.read(imageFrontProvider.notifier).update((state) => imageCaptured);
    final inputImage = InputImage.fromFile(File(imageCaptured.path));
    final textrecognizer = TextRecognizer();
    final RecognizedText recognizedText = await textrecognizer.processImage(inputImage);
    var lines = recognizedText.text;
   Logger().i(lines);
   debugPrint(lines);
   var textLines = await extractText(lines);
   ref.read(surNameProvider.notifier).update((state) => textLines[0]);
   ref.read(firstNameProvider.notifier).update((state) => textLines[1]);
   Logger().i(textLines);
    ref.read(cardDetailsProvider.notifier).update((state) => textLines);
    } 
    
    else if(imageFront != null && imageBack == null){
    final imageCaptured = await cameraController.takePicture(); 
    ref.read(imageBackProvider.notifier).update((state) => imageCaptured);
    final inputImage = InputImage.fromFile(File(imageCaptured.path));
    final textrecognizer = TextRecognizer();
    final RecognizedText recognizedText = await textrecognizer.processImage(inputImage);
    var blocks = recognizedText.blocks;
    var lines = recognizedText.text;
   Logger().i(lines);
   debugPrint(lines);
   var textLines = await extractText(lines);
 Logger().i(textLines);
 ref.read(kycProgressProvider.notifier).update((state) => 1);

    }
}

Future<void>_pickImage()async{
  final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    ref.read(cardImageProvider.notifier).update((state) => pickedImage);
    final inputImage = InputImage.fromFile(File(pickedImage!.path));
    final textrecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textrecognizer.processImage(inputImage);
    var blocks = recognizedText.blocks;
    var lines = recognizedText.text;
   Logger().i(lines);
   var textLines = await extractText(lines);
   ref.read(cardDetailsProvider.notifier).update((state) => textLines);
    Get.to(const VerifyAccountDetails());
}
}




