import 'package:flutter_windows/utils/storeage.dart';
import 'package:get/get.dart';

class UserInfo extends GetxController {
  // 本地存储对象
  final storage = Storage();

  // 用户名字
  var name = "".obs;

  // 用户密码
  var passwd = "".obs;

  // 用户年龄
  var age = 0.obs;

  // 用户权限
  var power = [].obs;

  // 以下为周期函数
  @override
  void onInit() {
    print('onInit');
    super.onInit();
    storage.getStorage("name").then((value) {
      print("得到的存储数据是: ${value}");
      name.value = value.toString();
    });
  }

  @override
  void onClose() {
    // 控制器绑定在路由上的话，路由销毁则触发
    print('onClose');
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    print('onReady');
  }

  // 增加状态管理的数值
  void addAge() {
    age.value++;
    update(); // 调用obx更新数据，不然数据不会更新
  }

  // 减少状态管理的数值
  void setName(String val) {
    name.value = val;
    storage.setStorage("name", name.value);
    update();
  }

  // 修改用户密码
  void setPasswd(String pw) {
    passwd.value = pw;
    update();
  }

  // 配置用户权限
  void addPower(pws) {
    var pwsTemp = [...power, ...pws];
    power.value = pwsTemp;
  }

  // 清空状态数据
  void clear() {
    name.value = "";
    passwd.value = "";
    age.value = 0;
    power.value = [];
  }
}
