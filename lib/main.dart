import 'package:flutter/material.dart';
import 'package:flutter_windows/router/index.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'i18n/translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // 桌面端字体粗细不一致和繁体的情况
          fontFamily: Platform.isWindows ? "微软雅黑" : null,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      locale: const Locale('zh'),
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      defaultTransition: Transition.fade,
      getPages: AppPage.routes,
    );
  }
}
