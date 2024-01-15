import "package:flutter/material.dart";
import 'package:get/get.dart';
import "../components/loading.dart";
import "../stores/sys.dart";
import "../stores/user.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 实例化控制器，用put，lazyPut
    Counter counter = Get.put(Counter());
    UserInfo user = Get.put(UserInfo());

    return Scaffold(
      appBar: AppBar(
        title: Text("HOME页面"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text("这是首页"),
            const SizedBox(
              height: 10,
            ),
            Text("用户名是: ${user.name}"),
            const SizedBox(
              height: 10,
            ),
            Text("用户密码是：${user.passwd}"),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Text("用户年龄：${user.age}")),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Text("用户权限：${user.power.join(',')}")),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Text("Store存储：${counter.count}")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print("增加count的值");
                  counter.add();
                },
                child: Text("Store++")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print("增加count的值");
                  counter.dec();
                },
                child: Text("Store--")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print("添加Powers");
                  user.addPower([10]);
                },
                child: Text("添加Power：10")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print("跳转到列表页面");
                  Get.toNamed("/lists", arguments: {'id': '123456789'});
                  LoadingDialog.show();
                },
                child: Text("跳转到列表页面")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print("跳转到详情页面");
                  Get.toNamed("/detail", arguments: {'id': '123456789'});
                },
                child: Text("跳到详情带参数")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "退出登录提示",
                    middleText: "确认退出登录吗？",
                    confirmTextColor: Colors.white,
                    textConfirm: "确定",
                    textCancel: "取消",
                    onConfirm: () {
                      Get.toNamed("/login");
                      user.clear();
                      counter.clear();
                    },
                    onCancel: () {
                      print("取消");
                    },
                  );
                },
                child: Text("退出登录"))
          ],
        ),
      ),
    );
  }
}
