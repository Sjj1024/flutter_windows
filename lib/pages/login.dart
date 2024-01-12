import "package:flutter/material.dart";
import 'package:flutter_windows/stores/user.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // 实例化状态控制器，用put，lazyPut
    UserInfo user = Get.put(UserInfo());

    // 登录组件
    return Scaffold(
      appBar: AppBar(
        title: Text("登录页"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 180,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "请输入用户名",
                ),
                onChanged: (value) {
                  print("输入框的值变化了：$value");
                  user.setName(value);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 180,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "请输入密码",
                ),
                obscureText: true,
                onChanged: (value) {
                  print("输入框的值变化了：$value");
                  user.setPasswd(value);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      print("增加年龄");
                      user.addAge();
                    },
                    child: Text("增加年龄")),
                SizedBox(
                  width: 10,
                ),
                Obx(() => Text("${user.age}")),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print("跳转到首页");
                  // 添加用户权限列表
                  user.addPower([1, 3, 5]);
                  Get.toNamed("/");
                  // 使用组件的方式配置
                  // Get.to(Home(), transition: Transition.rightToLeftWithFade);
                },
                child: Text("点击登录")),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
