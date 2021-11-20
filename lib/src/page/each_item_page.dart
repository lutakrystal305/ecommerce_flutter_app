import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EachItemPage extends StatelessWidget {
  Map<String, dynamic> item;
  EachItemPage(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(item['name']),
          backgroundColor: Colors.green[900],
        ),
        body: Container(
          //alignment: Alignment.center,
          //margin: const EdgeInsets.all(20.0),
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                  //alignment: Alignment.center,
                  width: size.width,
                  height: size.height / 2,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Image.network(
                    item['img'],
                    fit: BoxFit.cover,
                  )),
              Positioned(
                top: size.height / 2 - 50,
                width: size.width,
                height: size.height / 2 + 50,
                child: Container(
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0)),
                    color: const Color(0xff0d1117),
                  ),
                  //padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black54,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          item['name'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          item['des'],
                          style:
                              TextStyle(color: Color(0xffaaaaaa), fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1,
                                    color: Color(0xff777777),
                                    style: BorderStyle.solid),
                                bottom: BorderSide(
                                    width: 1,
                                    color: Color(0xff777777),
                                    style: BorderStyle.solid))),
                        child: Text(
                          'Price:    ${item['price']} \$',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
