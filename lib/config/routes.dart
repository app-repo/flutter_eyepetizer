import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';
import 'package:flutter_openeye/public.dart';

class Routes {
  static String indexPage = "/indexpage";
  static String loginPage = "/loginpage";
  static String categoryPage = "/categorypage";
  static String rankPage = "/rankpage";
  static String specialTopicPage = "/specialTopicPage";
  static String lightTopicDetailPage = "/lightTopicDetailPage";
  static String tagVideoPage = "/tagVideoPage";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });

    router.define(indexPage, handler: indexHandler);
    router.define(loginPage, handler: loginHandler);
    router.define(categoryPage, handler: categoryHandler);
    router.define(rankPage, handler: rankHandler);
    router.define(specialTopicPage, handler: specialTopicHandler);
    router.define(lightTopicDetailPage, handler: lightTopicDetailHandler);
    router.define(tagVideoPage, handler: tagVideoHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.inFromRight}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return Application.router.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }
}
