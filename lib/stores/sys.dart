import 'package:get/get.dart';

class Counter extends GetxController {
  RxInt count = 0.obs;

  // 以下为周期函数
  @override
  void onInit() {
    print('onInit');
    super.onInit();
  }

  @override
  void onClose() {
    // 控制器绑定在路由上的话，路由销毁则触发
    print('onClose');
    super.onClose();
  }

  @override
  void onReady() {
    print('onReady');
    super.onReady();
  }

  // 增加状态管理的数值
  void add() {
    count.value++;
    update(); // 调用obx更新数据，不然数据不会更新
  }

  // 减少状态管理的数值
  void dec() {
    count.value--;
    update();
  }

  // 清空状态数据
  void clear() {
    count.value = 0;
  }
}
