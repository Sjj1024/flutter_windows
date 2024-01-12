import 'package:dio/dio.dart';

/// 请求方法:枚举类型
enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

// 创建请求类：封装dio
class Request {
  /// 单例模式
  static Request? _instance;

  // 工厂函数：执行初始化
  factory Request() => _instance ?? Request._internal();

  // 获取实例对象时，如果有实例对象就返回，没有就初始化
  static Request? get instance => _instance ?? Request._internal();

  /// Dio实例
  static Dio _dio = Dio();

  /// 初始化
  Request._internal() {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
        baseUrl: 'http://api.hado-official.cn:8087',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5));
    _instance = this;
    // 初始化dio
    _dio = Dio(options);
    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  /// 请求拦截器
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 对非open的接口的请求参数全部增加userId
    if (!options.path.contains("open")) {
      options.queryParameters["userId"] = "xxx";
    }
    // 头部添加token
    // options.headers["token"] = "xxx";
    // 更多业务需求
    handler.next(options);
    // super.onRequest(options, handler);
  }

  /// 相应拦截器
  void _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // 请求成功是对数据做基本处理
    if (response.statusCode == 200) {
      // 处理成功的响应
      // print("响应结果: $response");
    } else {
      // 处理异常结果
      print("响应异常: $response");
    }
    handler.next(response);
  }

  /// 错误处理: 网络错误等
  void _onError(DioException error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  /// 请求类：支持异步请求操作
  Future<T> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    dynamic data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };
    // 默认配置选项
    options ??= Options(method: _methodValues[method]);
    try {
      Response response;
      // 开始发送请求
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioException catch (e) {
      print("发送请求异常: $e");
      rethrow;
    }
  }

  /// 开启日志打印
  /// 需要打印日志的接口在接口请求前 Request.instance?.openLog();
  void openLog() {
    _dio.interceptors
        .add(LogInterceptor(responseHeader: false, responseBody: true));
  }
}
