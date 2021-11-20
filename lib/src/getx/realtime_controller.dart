import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class RTController extends GetxController {
  List<CameraDescription>? cameras;
  var controller = Rxn<CameraController>();
  RxBool isDetecting = false.obs;
  RxBool check = false.obs;
  final _recognitions = Rxn<List>();
  RxInt _imageWidth = 0.obs;
  RxInt _imageHeight = 0.obs;

  List? get recognitions => _recognitions.value;
  int? get imageWidth => _imageWidth.value;
  int? get imageHeight => _imageHeight.value;

  loadTfModel() async {
    // ignore: avoid_print
    print('load model1');
    await Tflite.loadModel(
      model: "assets/ssd_mobilenet_v1_1_metadata_1.tflite",
      labels: "assets/ssd_mobilenet.txt",
    );
  }

  initCam() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadTfModel();
    initCam().whenComplete(() {
      //print(cameras);
      solveCamController();
    });
  }

  @override
  void onClose() {
    //WidgetsBinding.instance!.removeObserver(controller);
    closeCamAndStream();
    controller.value = null;

    cameras = [];
    //RTController.onClose();
    // TODO: implement onClose

    super.onClose();
    //controller.value!.stopImageStream();
    controller.close();
  }

  void closeCamAndStream() {
    if (controller.value!.value.isStreamingImages) {
      controller.value!.stopImageStream();
    }
  }

  void solveCamController() {
    if (cameras == null || cameras!.isEmpty) {
      // ignore: avoid_print
      print('No Cameras Found.');
    } else {
      // ignore: avoid_print
      //print('true1'); //oke
      controller.value = CameraController(
        cameras![0],
        ResolutionPreset.high,
      );
      controller.value!.initialize().then((_) {
        // if (!mounted) {
        //   return;
        // }
        // setState(() {});
        //print(controller.value);
        _recognitions.value = [];

        controller.value!.startImageStream((CameraImage img) {
          //khong chay
          //ignore: avoid_print
          //print('haizvl');
          //print(isDetecting.value);
          if (!isDetecting.value) {
            // ignore: avoid_print
            //print(isDetecting);
            isDetecting.value = true;
            Tflite.detectObjectOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(),
              model: "SSDMobileNet",
              imageHeight: img.height,
              imageWidth: img.width,
              imageMean: 127.5,
              imageStd: 127.5,
              numResultsPerClass: 1,
              threshold: 0.4,
            ).then((recognitions) {
              // ignore: avoid_print
              print(recognitions);
              /*
              When setRecognitions is called here, the parameters are being passed on to the parent widget as callback. i.e. to the LiveFeed class
               */
              //widget.setRecognitions(recognitions!, img.height, img.width);
              _recognitions.value = recognitions;
              _imageHeight.value = img.height;
              _imageWidth.value = img.width;
              isDetecting.value = false;
            });
          }
        });
      });
    }
  }
}
