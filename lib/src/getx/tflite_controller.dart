import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteController extends GetxController {
  File? _img;
  // ignore: prefer_final_fields
  RxString _path = ''.obs; //= File('');
  final _recognitions = Rxn<List>();
  late bool _pusy = false;
  RxDouble _imgW = 0.0.obs;
  RxDouble _imgH = 0.0.obs;

  String get path => _path.value;
  File? get img => _img;
  List? get recognitions => _recognitions.value;
  bool get pusy => _pusy;
  double? get imgW => _imgW.value;
  double? get imgH => _imgH.value;

  loadModel() async {
    // ignore: avoid_print
    print('load model');
    await Tflite.loadModel(
        model: 'assets/ssd_mobilenet_v1_1_metadata_1.tflite',
        labels: 'assets/ssd_mobilenet.txt');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadModel();
  }

  final picker = ImagePicker();

  detectObj(File img) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: img.path,
        model: 'SSDMobileNet',
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4,
        numResultsPerClass: 10,
        asynch: true);
    FileImage(img)
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      _imgW.value = info.image.width.toDouble();
      _imgH.value = info.image.height.toDouble();
    }));
    _recognitions.value = recognitions!;
  }

  List<Widget> renderBox(Size screen) {
    // ignore: unnecessary_null_comparison
    if (_recognitions == null) return [];
    if (_imgW == null || _imgH == null) return [];

    double factorX = screen.width;
    double factorY = _imgH.value / _imgH.value * screen.width;

    // ignore: avoid_print
    print(_recognitions);

    Color green = Colors.green;

    // ignore: avoid_unnecessary_containers
    return _recognitions.value!
        // ignore: avoid_unnecessary_containers
        .map((x) {
      return Container(
        child: Positioned(
            left: x['rect']['x'] * factorX,
            top: x['rect']['y'] * factorY,
            width: x['rect']['w'] * factorX,
            height: x['rect']['h'] * factorY,
            child: (x['confidenceInClass'] > 0.5)
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: green,
                      width: 3,
                    )),
                    child: Text(
                        "${x['detectedClass']} : ${(x['confidenceInClass'] * 100).toStringAsFixed(0)}%",
                        style: TextStyle(
                            background: Paint()..color = green,
                            color: Colors.white,
                            fontSize: 15)))
                : Container()),
      );
    }).toList();
  }

  Future getImageFromCamera() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _path.value = pickedFile.path;
      _img = File(pickedFile.path);
    } else {
      // ignore: avoid_print
      print('No image selected!');
    }
    detectObj(_img!);
  }

  Future getImageFromGallery() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _path.value = pickedFile.path;
      _img = File(pickedFile.path);
    } else {
      // ignore: avoid_print
      print('No image selected!');
    }
    detectObj(File(_path.value));
  }
}
