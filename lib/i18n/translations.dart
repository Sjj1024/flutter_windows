import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "appTitle": "TodoDemo",
          "login": "login",
          "loginPage": "login page",
          "userName": "user name",
          "password": "password",
          "addAge": "add age",
          "switchLanguage": "switch language",
          "addPowers": "addPowers @power",
          "toSecondPage": "to second page",
          "secondPage": "this is the second Page",
        },
        'zh_CN': {
          "appTitle": "待办",
          "login": "登录",
          "loginPage": "登录页",
          "userName": "请输入用户名",
          "password": "请输入密码",
          "addAge": "增加年龄",
          "switchLanguage": "切换中英文",
          "addPowers": "添加权限 @power",
          "toSecondPage": "去到第二页",
          "secondPage": "这里上第二页",
        }
      };
}
