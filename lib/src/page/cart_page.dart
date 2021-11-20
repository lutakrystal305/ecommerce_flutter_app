import 'package:cracker_cookie/src/getx/market_controller.dart';
import 'package:cracker_cookie/src/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MarketController _marketController = Get.find();
    return Obx(() => _marketController.listCart.isNotEmpty
        ? SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      '${_marketController.total_count.value} products are priced at ${_marketController.total_price.value} \$',
                      style: TextStyle(color: Color(0xffaaaaaa), fontSize: 18),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      //scrollDirection: Axis.vertical,
                      itemCount: _marketController.listCart.length,
                      itemBuilder: (context, index) =>
                          CartItem(_marketController.listCart[index])),
                ],
              ),
            ),
          )
        : const Center(
            child: Text(
            'No item was selected!!!',
            style: TextStyle(color: Colors.white),
          )));
  }
}
