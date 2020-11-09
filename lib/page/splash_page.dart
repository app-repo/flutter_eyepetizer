import 'package:flutter/material.dart';
import 'package:flutter_openeye/config/routes.dart';
import 'package:flutter_openeye/public.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SpUtil.getInstance();
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pop(context);
      Routes.navigateTo(context, Routes.indexPage,clearStack: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        "images/icon_splash_bg.jpeg",
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
