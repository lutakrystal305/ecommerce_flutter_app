import 'package:cracker_cookie/src/getx/market_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  Map<String, dynamic> item;
  CartItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MarketController _marketController = Get.find();
    var idx = _marketController.listCart
        .indexWhere((element) => element['id'] == item['id']);
    //var idx = itemNow['id'] - 1;
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        margin: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        //height: 250.0,
        decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xff777777), width: 1, style: BorderStyle.solid),
          color: const Color(0xff111111),
          borderRadius: BorderRadius.circular(24.0),
          // border: Border.all(
          //     width: 1,
          //     style: BorderStyle.solid,
          //     color: const Color(0xffaaaaaa))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    item['name'],
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(1.0),
                margin: const EdgeInsets.all(1.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        onPressed: () {
                          _marketController.onCountDown(item['id']);
                        },
                        icon: const Icon(
                          Icons.do_not_disturb_alt_sharp,
                          color: Colors.green,
                          size: 25.0,
                        ),
                        color: Colors.green,
                      ),
                    ),
                    Obx(() => Text(
                          '${_marketController.listCart[idx]['count'].value}',
                          style: TextStyle(color: Colors.white),
                        )),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        onPressed: () {
                          print('truu');
                          _marketController.onCountUp(item['id']);
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 25.0,
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
