import 'dart:io';

import 'package:cracker_cookie/src/getx/tflite_controller.dart';
import 'package:cracker_cookie/src/widgets/render_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaticImage extends StatelessWidget {
  const StaticImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TfliteController _tfController = Get.put(TfliteController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(alignment: Alignment.center, child: RenderBoxes(size)),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _tfController.getImageFromCamera,
            heroTag: 'button1',
            child: const Icon(Icons.camera_alt),
          ),
          FloatingActionButton(
            onPressed: _tfController.getImageFromGallery,
            heroTag: 'button2',
            child: const Icon(Icons.photo),
          )
        ],
      ),
    );
  }
}
