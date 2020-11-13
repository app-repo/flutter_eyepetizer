import 'package:flutter/material.dart';
import 'package:flutter_openeye/page/home/category_page.dart';
import 'package:flutter_openeye/page/home/rank_page.dart';
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
