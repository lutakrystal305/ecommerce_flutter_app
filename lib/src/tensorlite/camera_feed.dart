import 'dart:math';

import 'package:camera/camera.dart';
import 'package:cracker_cookie/src/getx/realtime_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraFeed extends StatelessWidget {
  const CameraFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RTController _rtController = Get.find();
    return Obx(() {
      //print('1');
      //print(_rtController.controller.value);
      // ignore: unnecessary_null_comparison
      if (_rtController.controller.value == null ||
          !_rtController.controller.value!.value.isInitialized) {
        return Container();
      }

      var tmp = MediaQuery.of(context).size;
      var screenH = max(tmp.height, tmp.width);
      var screenW = min(tmp.height, tmp.width);
      tmp = _rtController.controller.value!.value.previewSize!;
      var previewH = max(tmp.height, tmp.width);
      var previewW = min(tmp.height, tmp.width);
      var screenRatio = screenH / screenW;
      var previewRatio = previewH / previewW;

      return OverflowBox(
        maxHeight: screenRatio > previewRatio
            ? screenH
            : screenW / previewW * previewH,
        maxWidth: screenRatio > previewRatio
            ? screenH / previewH * previewW
            : screenW,
        child: CameraPreview(_rtController.controller.value!),
      );
    });
  }
}
