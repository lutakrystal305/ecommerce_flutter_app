import 'package:cracker_cookie/src/getx/market_controller.dart';
import 'package:cracker_cookie/src/getx/route_controller.dart';
import 'package:cracker_cookie/src/value/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabMain extends StatelessWidget {
  const BottomTabMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RouteController _routeController = Get.find();
    void _onTap(int index) {
      _routeController.changeRoute(index);
    }

    return Obx(() => BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: 'Market'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                label:
                    'Cart (${Get.find<MarketController>().listCart.length})'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'About me'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting')
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff111111),
          currentIndex: _routeController.route.value,
          selectedItemColor: Colors.green[600],
          unselectedItemColor: Colors.grey[200],
          onTap: _onTap,
        ));
  }
}
