import 'package:cracker_cookie/src/model/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<ItemModel> listItem = [
    ItemModel(
        'Bánh cracker gạo lứt vị tỏi đen',
        [
          'https://res.cloudinary.com/den6tpnab/image/upload/v1634610428/08052019__13__08f99d2776a94c2da52688a2be618651_master_gxxz9o.jpg',
          'https://res.cloudinary.com/den6tpnab/image/upload/v1634610464/banh2_dqiohh.jpg'
        ],
        [
          'Đây là 1 món bánh ăn vặt thích hợp cho mọi người đặc biệt là người bị tiểu đường vì thành phần của bánh rất tốt cho người tiểu đường như gạo lứt, đường ăn kiêng.',
          'Ngoài ra còn bổ sung thêm bột tỏi đen để tăng thêm mùi vị hấp dẫn và những dinh dưỡng mà tỏi đen mang lại.'
        ],
        0.obs),
    ItemModel(
        'Bánh bông lan nhân kem cải bó xôi',
        [
          'https://res.cloudinary.com/den6tpnab/image/upload/v1634610807/20200919113345-banh-bong-lan-kem-vi-la-dua-solite-360g-4_ltqtzs.jpg',
          'https://res.cloudinary.com/den6tpnab/image/upload/v1634610797/banh-bong-lan-la-dua-1-1_x1snyw.jpg',
          'https://res.cloudinary.com/den6tpnab/image/upload/v1634610816/xP7JqlQEcF_up_kqqtwt.jpg'
        ],
        [
          'Bánh được làm như các loại bánh bông lan thông thường nhưng ở đây nhân kem sử dụng được làm từ cải bó xôi, 1 nguyên liệu rất mới lạ nhưng đem lại rất nhiều chức năng cho chúng ta.',
          'Hiện nay bánh vẫn còn đang trong quá trình nghiên cứu và phát triển nên chúng tôi chỉ sử dụng hình minh họa từ các sản phẩm gần giống',
          'No available'
        ],
        0.obs)
  ].obs;
  var pageCtrl = Rxn<PageController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageCtrl.value = PageController(viewportFraction: 0.9);
  }

  //RxInt currentIndex = 0.obs;
  onChangeIndex(int index1, int index2) {
    listItem[index1].currentIndex.value = index2;
    // ignore: avoid_print
    //print(listItem[index1].currentIndex);
  }
}
