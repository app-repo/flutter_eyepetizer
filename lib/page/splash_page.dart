import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/config/routes.dart';
import 'package:flutter_openeye/public.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  // Animation<double> animation;
  // AnimationController controller;

  @override
  void initState() {
    super.initState();
    SPUtil.getInstance();
    ScreenUtil.getInstance();
    // controller = AnimationController(
    //     duration: Duration(milliseconds: 2500), vsync: this);
    Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.pop(context);
      Routes.navigateTo(context, Routes.indexPage, clearStack: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CachedNetworkImage(
        imageUrl:
            "http://img.kaiyanapp.com/98da9e0a2b258ab32b7d2d30315a937c.jpeg?imageMogr2/quality/60/format/jpg",
        fit: BoxFit.fill,
        errorWidget: (c, url, e) => Image.asset("images/icon_splash_bg.jpeg"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
