import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_work/common/config/config.dart';
import 'dart:async';

/*
 * 封装 restful 请求
 * 
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class HttpUtils {
  /// global dio object
  static Dio dio;

  /// default options
  // static const String API_PREFIX = 'https://novel.dkvirus.com/api/v1';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// request method
  static Future<Map> request(String url,
      {data, method, Map<String, dynamic> headers}) async {
    headers = headers ?? {};
    data = data ?? {};
    method = method ?? 'GET';

    /// restful 请求处理
    /// /gysw/search/hist/:user_id        user_id=27
    /// 最终生成 url 为     /gysw/search/hist/27
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印请求相关信息：请求地址、请求方式、请求参数
    if (Config.DEBUG) {
      print('请求地址：【' + method + '  ' + url + '】');
      print('请求参数：' + data.toString());
    }

    Dio dio = createInstance();
    Map result;

    try {
      dio.options.headers = headers;
      Response response = await dio.request(
        url,
        data: data,
        options: new Options(method: method),
      );
      if (response.statusCode == 200) {
        if (response.data is Map) {
          result = response.data;
        } else {
          result = json.decode(response.data.toString());
        }
      }

      /// 打印响应相关信息
      if (Config.DEBUG) {
        print('响应数据：' + response.toString());
      }
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      formatError(e);
    }

    return result;
  }

  /// 下载文件
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /// error统一处理
  static void formatError(DioError err) {
    Map _result;
    if (err != null && err.response != null) {
      switch (err.response.statusCode) {
        case 400:
          _result = {"code": '400', "msg": '错误请求[400]'};
          break;
        case 401:
          _result = {"code": '401', "msg": '未授权，请重新登录[401]'};
          break;
        case 403:
          _result = {"code": '403', "msg": '拒绝访问[403]'};
          break;
        case 404:
          _result = {"code": '404', "msg": '未找到资源[404]'};
          break;
        case 405:
          _result = {"code": '405', "msg": '请求方法未允许[405]'};
          break;
        case 408:
          _result = {"code": '408', "msg": '请求超时[408]'};
          break;
        case 500:
          _result = {"code": '500', "msg": '服务器出错[500]'};
          break;
        case 501:
          _result = {"code": '501', "msg": '网络未实现[501]'};
          break;
        case 502:
          _result = {"code": '502', "msg": '网络错误[502]'};
          break;
        case 503:
          _result = {"code": '503', "msg": '服务不可用[503]'};
          break;
        case 504:
          _result = {"code": '504', "msg": '网络超时[504]'};
          break;
        case 505:
          _result = {"code": '505', "msg": 'http版本不支持该请求[505]'};
          break;
        default:
          _result = {"code": '9999', "msg": '连接错误[9999]'};
      }
    } else {
      _result = {"code": '9999', "msg": '连接到服务器失败[9999]'};
    }
    // PublicUtils.toast(_result['msg']);
    throw FormatException(_result['msg']);
    // if (e.type == DioErrorType.CONNECT_TIMEOUT) {
    //   PublicUtils.toast('连接超时:' + e.message.toString());
    // } else if (e.type == DioErrorType.SEND_TIMEOUT) {
    //   PublicUtils.toast('请求超时:' + e.message.toString());
    // } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
    //   PublicUtils.toast('响应超时:' + e.message.toString());
    // } else if (e.type == DioErrorType.RESPONSE) {
    //   PublicUtils.toast('出现异常:' + e.message.toString());
    // } else if (e.type == DioErrorType.CANCEL) {
    //   PublicUtils.toast('请求取消:' + e.message.toString());
    // } else {
    //   PublicUtils.toast('未知错误:' + e.message.toString());
    // }
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(
        /// baseUrl: API_PREFIX,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,

        /// 请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
        contentType: ContentType.json,

        /// 表示期望以那种格式(方式)接受响应数据。接受三种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
        responseType: ResponseType.json,
      );

      dio = new Dio(options);

      /// Cookie管理
      dio.interceptors.add(CookieManager(CookieJar()));

      /// 添加拦截器
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        if (Config.DEBUG) {
          print("请求之前");
        }
        return options;
      }, onResponse: (Response response) {
        if (Config.DEBUG) {
          print("响应之前");
        }
        return response;
      }, onError: (DioError e) {
        if (Config.DEBUG) {
          print("错误之前");
        }
        return e;
      }));
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
