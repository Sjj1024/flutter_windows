import 'package:flutter/material.dart';
import 'package:flutter_windows/router/index.dart';
import 'package:get/get.dart';
import 'package:auto_updater/auto_updater.dart';
import 'i18n/translations.dart';

void main() async {
  // 必须加上这一行
  WidgetsFlutterBinding.ensureInitialized();
  String feedURL =
      'https://carrier-mljr-test.oss-cn-beijing.aliyuncs.com/hado_file/update/appcast.xml';
  await autoUpdater.setFeedURL(feedURL);
  await autoUpdater.checkForUpdates(inBackground: false);
  // await autoUpdater.setScheduledCheckInterval(3600);
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
          // 解决桌面端字体粗细不一致和繁体的情况
          fontFamily: identical(0, 0.0) ? null : "微软雅黑",
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      locale: Get.deviceLocale,
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      defaultTransition: Transition.noTransition,
      getPages: AppPage.routes,
    );
  }
}
