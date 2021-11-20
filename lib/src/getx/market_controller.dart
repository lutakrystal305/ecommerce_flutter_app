import 'package:cracker_cookie/src/value/products.dart';
import 'package:get/get.dart';

class MarketController extends GetxController {
  RxList listCart = [].obs;
  RxList items = [].obs;
  RxDouble total_price = 0.0.obs;
  RxInt total_count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    items.value = products;
  }

  onChangeSearch(String a) {
    //print(a);
    var z = products.where((x) => x['name'].indexOf(a) >= 0).toList();
    //print(z);
    items.value = z;
  }

  onSelect(Map<String, dynamic> x) {
    x['count'] = 1.obs;
    print(x);
    // ignore: invalid_use_of_protected_member
    //print(x['count']);

    listCart.add(x);
    total_count.value += 1;
    var a = double.parse(x['price']);
    print(a);
    total_price.value += a;
  }

  onCountUp(int i) {
    print(listCart);
    total_count.value += 1;
    total_price.value += double.parse(products[i - 1]['price']);
    listCart.firstWhere((element) => element['id'] == i)['count'].value += 1;
    //a['count'].value += 1;
  }

  onCountDown(int i) {
    print('vai lozz');
    total_count.value -= 1;
    total_price.value -= double.parse(products[i - 1]['price']);
    listCart.firstWhere((element) => element['id'] == i)['count'].value -= 1;
    listCart.forEach((element) {
      if (element['count'].value < 1) {
        listCart.remove(element);
      }
    });
    //a['count'].value -= 1;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
