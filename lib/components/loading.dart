import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog {
  static show() {
    Get.dialog(
      GestureDetector(
        child: Container(
          color: Colors.black54,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
        onTap: () {
          print("点击loading退出loading");
          Get.back();
        },
      ),
      barrierDismissible: false,
    );
  }

  static hide() {
    Get.back();
  }
}
