import 'package:get/get_rx/get_rx.dart';

class ItemModel {
  final String name;
  final List<String> img;
  final List<String> des;
  RxInt currentIndex;
  ItemModel(this.name, this.img, this.des, this.currentIndex);
}
