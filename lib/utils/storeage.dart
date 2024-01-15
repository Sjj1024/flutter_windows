import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// 封装一个本地存储的类
class Storage {
  // 静态单例模式:静态私有实例对象
  static Storage? _instance;

  // 实现工厂函数
  factory Storage() => _instance ?? Storage._init();

  /// 命名构造函数 用于初始化SharedPreferences实例对象
  Storage._init() {
    // 初始化SharedPreferences实例
    _initStorage();
  }

  // SharedPreferences对象
  static late SharedPreferences _storage;

  // 之所以这个没有写在 _init中，是因为SharedPreferences.getInstance是一个异步的方法 需要用await接收它的值
  _initStorage() async {
    try {
      _storage = await SharedPreferences.getInstance();
    } catch (e) {
      _storage = await SharedPreferences.getInstance();
    }
  }

  /// 设置存储
  setStorage(String key, dynamic value) async {
    await _initStorage();
    String type;
    // 监测value的类型 如果是Map和List,则转换成JSON，以字符串进行存储
    if (value is Map || value is List) {
      type = 'String';
      value = const JsonEncoder().convert(value);
    }
    // 否则 获取value的类型的字符串形式
    else {
      type = value.runtimeType.toString();
    }
    // 根据value不同的类型 用不同的方法进行存储
    switch (type) {
      case 'String':
        _storage.setString(key, value);
        break;
      case 'int':
        _storage.setInt(key, value);
        break;
      case 'double':
        _storage.setDouble(key, value);
        break;
      case 'bool':
        _storage.setBool(key, value);
        break;
    }
  }

  /// 获取存储 注意：返回的是一个Future对象 要么用await接收 要么在.then中接收
  Future<dynamic> getStorage(String key) async {
    await _initStorage();
    // 获取key对应的value
    dynamic value = _storage.get(key);
    // 判断value是不是一个json的字符串 是 则解码
    if (_isJson(value)) {
      return const JsonDecoder().convert(value);
    } else {
      // 不是 则直接返回
      return value;
    }
  }

  /// 是否包含某个key
  Future<bool> hasKey(String key) async {
    await _initStorage();
    return _storage.containsKey(key);
  }

  /// 删除key指向的存储 如果key存在则删除并返回true，否则返回false
  Future<bool> removeStorage(String key) async {
    await _initStorage();
    if (await hasKey(key)) {
      await _storage.remove(key);
      return true;
    } else {
      return false;
    }
    // return  _storage.remove(key);
  }

  /// 清空存储 并总是返回true
  Future<bool> clear() async {
    await _initStorage();
    _storage.clear();
    return true;
  }

  /// 获取所有的key 类型为Set<String>
  Future<Set<String>> getKeys() async {
    await _initStorage();
    return _storage.getKeys();
  }

  // 判断是否是JSON字符串
  _isJson(dynamic value) {
    try {
      // 如果value是一个json的字符串 则不会报错 返回true
      const JsonDecoder().convert(value);
      return true;
    } catch (e) {
      // 如果value不是json的字符串 则报错 进入catch 返回false
      return false;
    }
  }
}

// 导出一个全局使用的实例

// 使用的一些示例
/*
  var ps = Storage();
  // 1. 存储所有类型的值
  ps.setStorage('Map', {"key": "value"}); // 存储Map
  ps.setStorage('int', 1); // 存储int
  ps.setStorage('double', 1.0); // 存储double
  ps.setStorage('bool', true); // 存储bool
  ps.setStorage('String', "Hello World"); // 存储String
  ps.setStorage('List', [1, true, 'String', 1.0]); // 存储List
  // 除setStorage以外 获取的方法的返回值全部都是Future类型
  // 因此需要使用await获取 或者 在其.then方法中获取值
  // 2. 根据key获取存储的值
  // 2.1 通过await 直接获取存储的值 注意 await只能在async方法中使用
  Logger().i(await ps.getStorage('Map')); // {key: value}
  // 2.2 在then中获取存储的值
  ps.getStorage('String').then((value) => Logger().i(value)); // {key: value}
  // 3. 根据key移除存储的值
  Logger().i(await ps.removeStorage("List")); // true  删除成功
  Logger().i(await ps.removeStorage('nothing')); // false 删除失败
  // 4. 是否包含某个key
  Logger().i(await ps.hasKey('map')); // 存在   true
  Logger().i(await ps.hasKey("List")); // 不存在 false
  // 5. 获取所有的key
  Logger().i(await ps.getKeys());
  // 6. 清空所有存储
  Logger().i(await ps.clear()); //一直都会返回true
*/
