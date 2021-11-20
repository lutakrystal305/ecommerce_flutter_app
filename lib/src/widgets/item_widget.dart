import 'package:cracker_cookie/src/getx/home_controller.dart';
import 'package:cracker_cookie/src/model/item_model.dart';
import 'package:cracker_cookie/src/value/app_style.dart';
import 'package:cracker_cookie/src/widgets/build_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel tempt;
  const ItemWidget(this.tempt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(tempt.name);
    final _pageController = PageController(viewportFraction: 0.8);
    final HomeController _homeController = Get.find();
    int indexWidget =
        _homeController.listItem.indexWhere((element) => element == tempt);
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.white54),
                      bottom: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.white54))),
              child: Text(tempt.name,
                  style: AppStyle.h3.copyWith(
                      color: const Color(0xffdddddd),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.5,
                      shadows: const [
                        Shadow(
                            color: Colors.grey,
                            offset: Offset(3, 5),
                            blurRadius: 5)
                      ])),
            ),
            Container(
              // set container size for pageview
              alignment: Alignment.centerLeft,
              height: 350,
              margin: const EdgeInsets.only(top: 20.0),
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: tempt.img.length,
                  onPageChanged: (index) {
                    _homeController.onChangeIndex(indexWidget, index);
                  },
                  itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black38,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.green[400],
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(6, 8),
                                    blurRadius: 5)
                              ],
                            ),
                            child: Image.network(tempt.img[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity),
                          ),
                        ],
                      )),
            ),
            Container(
                height: 10.0,
                width: double.infinity,
                //margin: const EdgeInsets.symmetric(vertical: 16.0),
                //padding: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: tempt.img.length,
                    itemBuilder: (context, index) =>
                        BuildIndicator(index, indexWidget))),
            Obx(() => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Text(
                      tempt.des[_homeController
                          .listItem[indexWidget].currentIndex.value],
                      style: AppStyle.h4.copyWith(
                          color: const Color(0xffbbbbbb), fontSize: 13)),
                ))
          ],
        ));
  }
}
