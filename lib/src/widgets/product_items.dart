import 'package:cracker_cookie/src/getx/market_controller.dart';
import 'package:cracker_cookie/src/page/each_item_page.dart';
import 'package:cracker_cookie/src/value/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  Map<String, dynamic> a;
  ProductItem(this.a, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final MarketController _marketController = Get.find();
    return GestureDetector(
      onTap: () {
        print('fall');
        Get.to(EachItemPage(a));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          height: 150,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 130,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                          width: 1,
                          color: AppColor.lightGrey,
                          style: BorderStyle.solid)),
                  child: Image.network(
                    a['img'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          a['name'],
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white70),
                        ),
                      ),
                      Container(
                          //margin: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                        a['ingredient'],
                        style: const TextStyle(
                            color: Colors.white30, fontSize: 12),
                      )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Price: ',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.white60)),
                          Text("\$ ${a['price']}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.bold)),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: ElevatedButton(
                                  onPressed: () {
                                    _marketController.onSelect(a);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green[900]),
                                  child: const Text(
                                    'Buy',
                                    style: TextStyle(color: Colors.white),
                                  )))
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
