import 'package:cracker_cookie/src/getx/aboutus_controller.dart';
import 'package:cracker_cookie/src/value/app_assets.dart';
import 'package:cracker_cookie/src/value/quotes.dart';
import 'package:cracker_cookie/src/widgets/build_indicator.dart';
import 'package:cracker_cookie/src/widgets/indicator_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsController _usController = Get.put(UsController());
    final _pageController = PageController();
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
            color: const Color(0xff0d1117),
            alignment: Alignment.center,
            child: Column(children: [
              Container(
                color: const Color(0xff0d1117),
                width: size.width,
                height: size.height / 2,
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      margin: const EdgeInsets.only(top: 30.0),
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppAssets.avt,
                        fit: BoxFit.contain,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white38,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(1000)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      child: const Text('Luta Krystal',
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: const Text('Quotes: ',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontStyle: FontStyle.italic)),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        alignment: Alignment.center,
                        height: 150,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            _usController.onChangePage(index);
                          },
                          itemCount: quotes.length,
                          itemBuilder: (context, index) => RichText(
                              text: TextSpan(
                                  text: quotes[index]['quote'],
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  children: [
                                const TextSpan(text: ' ---- '),
                                TextSpan(
                                    text: quotes[index]['author'],
                                    style: const TextStyle(
                                        color: Colors.grey, letterSpacing: 1.5))
                              ])),
                        )),
                    Container(
                        height: 5.0,
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: quotes.length,
                            itemBuilder: (context, index) =>
                                Indicator2(index))),
                    Container(
                        //height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                        )),
                        child: RichText(
                          text: TextSpan(
                              text: 'Age: ',
                              children: [
                                const TextSpan(text: '  '),
                                TextSpan(
                                    text: '21',
                                    style: TextStyle(
                                        color: Colors.purple[900],
                                        fontSize: 18))
                              ],
                              style: TextStyle(color: Colors.grey[400])),
                        )),
                    Container(
                        //height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                        )),
                        child: RichText(
                          text: TextSpan(
                              text: 'Address: ',
                              children: [
                                const TextSpan(text: '  '),
                                TextSpan(
                                    text: 'Quang Nam - Da Nang',
                                    style: TextStyle(
                                        color: Colors.greenAccent[700],
                                        fontSize: 18))
                              ],
                              style: TextStyle(color: Colors.grey[400])),
                        )),
                    Container(
                        //height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                          bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                        )),
                        child: RichText(
                          text: TextSpan(
                              text: 'Contact: ',
                              children: [
                                const TextSpan(text: '  '),
                                TextSpan(
                                    text: 'nguyenvanthai305@gmail.com',
                                    style: TextStyle(
                                        color: Colors.amber[600], fontSize: 18))
                              ],
                              style: TextStyle(color: Colors.grey[400])),
                        )),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Text('Available !!!',
                          style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.tealAccent[400],
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              )
            ])));
  }
}
