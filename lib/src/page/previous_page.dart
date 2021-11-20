import 'package:cracker_cookie/src/page/main_page.dart';
import 'package:cracker_cookie/src/value/app_assets.dart';
import 'package:cracker_cookie/src/value/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class PrePage extends StatelessWidget {
  const PrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                  alignment: Alignment.center,
                  //height: 140.0,
                  //width: 100.0,
                  child: Image.asset(AppAssets.pre_bg,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity)),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                color: Colors.black38,
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 20.0),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 77,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        AppAssets.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        //alignment: Alignment.center,
                        margin: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Luta',
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              shadows: [
                                Shadow(
                                    color: Color(0xff1b5e20),
                                    offset: Offset(4, 6),
                                    blurRadius: 5.0)
                              ]),
                        ))
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Text('Welcome to \n my store!!!!',
                      style: AppStyle.h4.copyWith(
                          letterSpacing: 5.0,
                          color: Colors.tealAccent[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                          shadows: const [
                            Shadow(
                                color: Colors.blue,
                                offset: Offset(2, 3),
                                blurRadius: 5)
                          ]))),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(bottom: 30.0, right: 30.0),
                child: ElevatedButton(
                    onPressed: () {
                      Get.off(const MainPage());
                    },
                    child: Container(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Enter the store!!',
                                style: AppStyle.h4
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const Icon(Icons.navigate_next)
                          ],
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green))),
              )
            ],
          )),
    );
  }
}
