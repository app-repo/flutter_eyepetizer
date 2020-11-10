import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_openeye/public.dart';
import 'package:shared_preferences/shared_preferences.dart';

var dio;

class HttpUtil {
  // 工厂模式
  static HttpUtil get instance => _getInstance();

  static HttpUtil _httpUtil;

  static HttpUtil _getInstance() {
    if (_httpUtil == null) {
      _httpUtil = HttpUtil();
    }
    return _httpUtil;
  }

  HttpUtil() {
    BaseOptions options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        baseUrl: Constant.COMMON_BASE_URL);
    dio = new Dio(options);
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("========================请求数据===================");
      print("url=${options.uri.toString()}");
      print("params=${options.data}");
      // dio.lock();
      // await SpUtil.getToken().then((token) {
      //   options.headers[Strings.TOKEN] = token;
      //   print("X-Litemall-Token=${options.headers[Strings.TOKEN]}");
      // });
      // dio.unlock();
      return options;
    }, onResponse: (Response response) {
      print("========================请求数据===================");
      // print("code=${response.statusCode}");
      // print("response=${response.data}");
    }, onError: (DioError error) {
      print("========================请求错误===================");
      print("message =${error.message}");
    }));
  }

  Future<Map> get(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    try {
      Response response;
      if (parameters != null && options != null) {
        response =
            await dio.get(url, queryParameters: parameters, options: options);
      } else if (parameters != null && options == null) {
        response = await dio.get(url, queryParameters: parameters);
      } else if (parameters == null && options != null) {
        response = await dio.get(url, options: options);
      } else {
        response = await dio.get(url);
      }
      var data = response.data;
      String jsonStr = json.encode(data);
      Map<String, dynamic> map = json.decode(jsonStr);
      return map;
    } on DioError catch (e) {
      return Map();
    }
  }

  Future<Map> post(String url,
      {Map<String, dynamic> parameters, Options options}) async {
    Response response;
    if (parameters != null && options != null) {
      response = await dio.post(url, data: parameters, options: options);
    } else if (parameters != null && options == null) {
      response = await dio.post(url, data: parameters);
    } else if (parameters == null && options != null) {
      response = await dio.post(url, options: options);
    } else {
      response = await dio.post(url);
    }
    return response.data;
  }
}
