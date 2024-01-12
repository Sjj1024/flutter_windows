import 'package:flutter_windows/pages/detail.dart';
import 'package:flutter_windows/pages/home.dart';
import 'package:get/get.dart';
import '../components/loading.dart';
import '../pages/list.dart';
import '../pages/login.dart';

class AppPage {
  static final routes = [
    GetPage(name: "/", page: () => const Home()),
    GetPage(name: "/login", page: () => const Login()),
    GetPage(name: "/lists", page: () => const Lists()),
    GetPage(name: "/detail", page: () => const Detail())
  ];
}
