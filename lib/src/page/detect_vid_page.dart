import 'dart:math';

import 'package:cracker_cookie/src/getx/realtime_controller.dart';
import 'package:cracker_cookie/src/tensorlite/camera_feed.dart';
import 'package:cracker_cookie/src/widgets/bouding_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DectectRTPage extends StatelessWidget {
  const DectectRTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RTController _rtController = Get.put(RTController());
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('real time'),
        ),
        // ignore: avoid_unnecessary_containers
        body: Obx(() => Container(
              child: Stack(
                children: [
                  CameraFeed(),
                  // ignore: unnecessary_null_comparison
                  _rtController.recognitions != null
                      ? BoundingBox(
                          _rtController.recognitions!,
                          max(_rtController.imageHeight!,
                              _rtController.imageWidth!),
                          min(_rtController.imageHeight!,
                              _rtController.imageWidth!),
                          screen.height,
                          screen.width)
                      : const Text('')
                ],
              ),
            )));
  }
}
