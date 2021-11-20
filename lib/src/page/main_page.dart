import 'package:cracker_cookie/src/getx/market_controller.dart';
import 'package:cracker_cookie/src/getx/realtime_controller.dart';
import 'package:cracker_cookie/src/getx/route_controller.dart';
import 'package:cracker_cookie/src/page/cart_page.dart';
import 'package:cracker_cookie/src/page/creator_page.dart';
import 'package:cracker_cookie/src/page/detector_page.dart';
import 'package:cracker_cookie/src/page/home_page.dart';
import 'package:cracker_cookie/src/page/market_page.dart';
import 'package:cracker_cookie/src/value/app_assets.dart';
import 'package:cracker_cookie/src/value/app_color.dart';
import 'package:cracker_cookie/src/widgets/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detector_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const List<Widget> _optionWidget = <Widget>[
    HomePage(),
    MarketPage(),
    CartPage(),
    AboutMePage(),
    DetectorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final MarketController _marketController = Get.put(MarketController());
    final RouteController _routeController = Get.put(RouteController());
    Obx(() {
      if (_routeController.route.value != 4) {
        Get.delete<RTController>();
      }
      return Container();
    });
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            var check = _routeController.route.value == 0
                ? 'Home'
                : _routeController.route.value == 1
                    ? 'Market'
                    : _routeController.route.value == 2
                        ? 'Cart Shopping'
                        : _routeController.route.value == 3
                            ? 'About us'
                            : 'Object Detection';
            return Text(check, style: const TextStyle(color: Colors.white));
          }),
          backgroundColor: Colors.green[900],
          leading: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.0)),
            width: 20,
            height: 20,
            child: Image.asset(AppAssets.logox, fit: BoxFit.cover),
          ),
        ),
        body: Container(
            //height: MediaQuery.of(context).size.height,
            color: const Color(0xff0d1117),
            constraints: const BoxConstraints.expand(),
            alignment: Alignment.center,
            //margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: .0),
            child: Obx(
                () => _optionWidget.elementAt(_routeController.route.value))),
        bottomNavigationBar: const BottomTabMain());
  }
}
