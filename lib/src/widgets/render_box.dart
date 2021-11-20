import 'dart:io';

import 'package:cracker_cookie/src/getx/tflite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenderBoxes extends StatelessWidget {
  Size screen;
  RenderBoxes(this.screen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TfliteController _tfController = Get.find();

    return Obx(() {
      if (_tfController.recognitions == null) return Container();
      if (_tfController.imgW == 0.0 || _tfController.imgH == 0.0)
        return Container();

      double factorX = screen.width;
      double factorY = _tfController.imgH! / _tfController.imgH! * screen.width;

      // ignore: avoid_print
      print(_tfController.recognitions);

      Color green = Colors.green;
      List<Widget> stackChildren = [];

      stackChildren.add(Positioned(
          child: Obx(() => _tfController.path == ''
              // ignore: avoid_unnecessary_containers
              ? Container(
                  child: const Text(
                  'Please select an image!',
                  style: TextStyle(color: Colors.black),
                ))
              : Container(
                  child: Image.file(File(_tfController.path)),
                ))));

      if (_tfController.pusy) {
        stackChildren.add(const Center(
          child: CircularProgressIndicator(),
        ));
      }

      List<Widget> boxes = _tfController.recognitions!.map((x) {
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
      stackChildren.addAll(boxes);
      // ignore: avoid_unnecessary_containers
      return Stack(children: stackChildren);
    });
  }
}
