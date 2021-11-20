import 'package:get/get.dart';

class UsController extends GetxController {
  @override
  void onInit() {
    _check.value = true;
    super.onInit();
  }

  @override
  void onClose() {
    _check.value = false;
    super.onClose();
  }

  RxInt _index = 0.obs;
  RxBool _check = false.obs;

  int? get index => _index.value;
  bool get check => _check.value;

  onChangePage(int i) {
    _index.value = i;
    _check.value = true;
  }
}
