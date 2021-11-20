import 'package:cracker_cookie/src/getx/market_controller.dart';
import 'package:cracker_cookie/src/page/each_item_page.dart';
import 'package:cracker_cookie/src/value/products.dart';
//import 'package:cracker_cookie/src/widgets/prodUCt_item.dart';
import 'package:cracker_cookie/src/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    final MarketController _marketController =
        Get.find(); //(MarketController());
    return Container(
      color: const Color(0xff0d1117),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Container(
                      //alignment: Alignment.center,
                      child: TextField(
                        controller: _textController,
                        onChanged: (text) {
                          print(text);
                          _marketController.onChangeSearch(text);
                        },
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 16),
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white54, width: 0.0)),
                            border: OutlineInputBorder(),
                            labelText: 'Search food here....',
                            labelStyle: TextStyle(color: Colors.white54)),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        //alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white38,
                        )),
                  ],
                )),
            Obx(() => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  '${_marketController.items.length} products is shown!',
                  style: const TextStyle(color: Colors.white),
                ))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Obx(() => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _marketController.items.length,
                  itemBuilder: (context, index) =>
                      ProductItem(_marketController.items[index]))),
            )
          ],
        ),
      ),
    );
  }
}
