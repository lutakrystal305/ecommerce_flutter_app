import 'package:cracker_cookie/src/getx/home_controller.dart';
import 'package:cracker_cookie/src/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.put(HomeController());
    return Container(
        //constraints: const BoxConstraints.expand(),
        //color: const Color(0xff0d1117),
        alignment: Alignment.center,
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            itemCount: _homeController.listItem.length,
            itemBuilder: (context, index) =>
                Obx(() => ItemWidget(_homeController.listItem[index]))));
  }
}
