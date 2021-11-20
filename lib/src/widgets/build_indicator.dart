//import 'package:cracker_cookie/src/getx/aboutus_controller.dart';
import 'package:cracker_cookie/src/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildIndicator extends StatelessWidget {
  final int index1;
  final int index2;
  const BuildIndicator(this.index1, this.index2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    //final UsController _usController = Get.find();
    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        // ignore: unrelated_type_equality_checks
        width: index1 == _homeController.listItem[index2].currentIndex.value
            ? 64.0
            : 32.0,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            // ignore: unrelated_type_equality_checks
            color: index1 == _homeController.listItem[index2].currentIndex.value
                ? Colors.blue[900]
                : Colors.white70,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
            ]),
      );
    });
  }
}
