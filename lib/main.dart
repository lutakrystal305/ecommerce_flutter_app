//import 'package:cracker_cookie/src/page/home_page.dart';
//import 'package:cracker_cookie/src/page/main_page.dart';
import 'package:camera/camera.dart';
import 'package:cracker_cookie/src/page/detector_page.dart';
import 'package:cracker_cookie/src/page/previous_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

/*void main() {
  runApp(const GetMaterialApp(home: PrePage()));
}*/
//List<CameraDescription> cameras = [];
void main() {
  // initialize the cameras when the app starts
  //WidgetsFlutterBinding.ensureInitialized();
  //cameras = await availableCameras();
  runApp(const GetMaterialApp(home: PrePage()));
}
