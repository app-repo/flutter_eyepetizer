import 'package:flutter/material.dart';
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
