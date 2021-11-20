import 'package:cracker_cookie/src/getx/aboutus_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indicator2 extends StatelessWidget {
  int index;
  Indicator2(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsController _usController = Get.find();
    return Obx(() => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          // ignore: unrelated_type_equality_checks
          width: index == _usController.index ? 32.0 : 16.0,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              // ignore: unrelated_type_equality_checks
              color: index == _usController.index
                  ? Colors.grey[800]
                  : Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
              ]),
        ));
  }
}
