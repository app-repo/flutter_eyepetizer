import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_openeye/http/interceptor/header_interceptor.dart';
import 'package:flutter_openeye/public.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interceptor/log_interceptor.dart';

var dio;

class HttpManager {
  // 工厂模式
  static HttpManager get instance => _getInstance();

  static HttpManager _httpManager;

  static HttpManager _getInstance() {
    if (_httpManager == null) {
      _httpManager = HttpManager();
    }
    return _httpManager;
  }

  HttpManager() {
    BaseOptions options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        responseType: ResponseType.json,
        baseUrl: Constant.COMMON_BASE_URL);
    dio = new Dio(options);
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(HeaderInterceptor());
    dio.interceptors.add(LogsInterceptors());
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
