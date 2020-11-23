import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_openeye/page/home/category_page.dart';
import 'package:flutter_openeye/page/home/light_topic_detail_page.dart';
import 'package:flutter_openeye/page/home/rank_page.dart';
import 'package:flutter_openeye/page/home/special_topic_page.dart';
import 'package:flutter_openeye/page/home/tag_video_page.dart';
import 'package:flutter_openeye/page/home/video_detail_page.dart';
import 'package:flutter_openeye/page/login_page.dart';
import 'package:flutter_openeye/public.dart';

var indexHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var categoryHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CategoryPage();
});

var rankHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RankPage();
});

var specialTopicHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SpecialTopicPage();
});

var lightTopicDetailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  var title = params['title']?.first;
  var id = params['id']?.first;
  return LightTopicDetailPage(title, id);
});

var tagVideoHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  var title = params['title']?.first;
  var id = params['id']?.first;
  var image = params['image']?.first;
  return TagVideoPage(title, id, image);
});

var videoDetailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {

  var id = params['id']?.first;
  var vUrl = params['vUrl']?.first;
  var bgUrl = params['bgUrl']?.first;

  return VideoDetailPage(id,vUrl,bgUrl);
});
