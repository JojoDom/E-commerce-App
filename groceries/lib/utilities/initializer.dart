import 'package:camera/camera.dart';

class Initializer{
  static late List<CameraDescription> cameras;

  static Future init()async{
   cameras = await availableCameras();
  }
}