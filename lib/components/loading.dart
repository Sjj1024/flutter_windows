import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog {
  static show() {
    print("显示loading");
    Get.dialog(
      Container(
        color: Colors.black54,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static hide() {
    print("取消loading");
    Get.back();
  }
}
