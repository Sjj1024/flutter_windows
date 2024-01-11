import "package:flutter/material.dart";

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录页"),
      ),
      body: Text("登录页面"),
    );
  }
}
