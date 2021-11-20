import 'package:camera/camera.dart';
import 'package:cracker_cookie/src/page/detect_img_page.dart';
import 'package:cracker_cookie/src/page/detect_vid_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class DetectorPage extends StatefulWidget {
  const DetectorPage({Key? key}) : super(key: key);

  @override
  _DetectorPageState createState() => _DetectorPageState();
}

class _DetectorPageState extends State<DetectorPage> {
  late List<CameraDescription>? cameras;
  initCam() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initCam();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Detection'),
        leading: IconButton(
          icon: const Icon(Icons.access_alarms_outlined),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
                minWidth: 170.0,
                child: ElevatedButton(
                  child: const Text('Dectector on an image'),
                  onPressed: () {
                    // ignore: prefer_const_constructors
                    Get.to(StaticImage());
                  },
                )),
            ButtonTheme(
                minWidth: 170.0,
                child: ElevatedButton(
                  child: const Text('Real time detector'),
                  onPressed: () {
                    Get.to(DectectRTPage());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
