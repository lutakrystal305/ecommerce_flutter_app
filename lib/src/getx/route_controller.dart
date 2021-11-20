import 'package:get/get.dart';

class RouteController extends GetxController {
  var route = 0.obs;
  changeRoute(int numberRoute) {
    // ignore: avoid_print
    print(numberRoute.obs);
    route.value = numberRoute;
  }
}
