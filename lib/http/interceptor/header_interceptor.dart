import 'package:dio/dio.dart';
import 'package:flutter_openeye/http/constant.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    options.headers["X_THEFAIR_APPID"] = Constant.X_THEFAIR_APPID;
    options.headers["Cookie"] = Constant.COOKIE;
    options.headers["x_api_key"] = Constant.x_api_key;
    options.headers["X_THEFAIR_CID"] = Constant.X_THEFAIR_CID;
    options.headers["X_THEFAIR_UA"] = Constant.X_THEFAIR_UA;
    options.headers["X_THEFAIR_AUTH"] = Constant.X_THEFAIR_AUTH;
    return super.onRequest(options);
  }
}
