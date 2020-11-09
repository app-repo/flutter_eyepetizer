import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_openeye/config/routes.dart';
import 'package:flutter_openeye/public.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  List<String> items = ["我的关注", "观看记录", "通知开关", "我的徽章", "意见反馈", "我要投稿"];

  var avatar = SpUtil.getString("avatar");

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () {
                if (avatar.isEmpty) {
                  Routes.navigateTo(context, Routes.loginPage);
                }
              },
              child: Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    child: Image.asset("images/pgc_default_avatar.png"),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("点击登录即可评论及发布内容"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildOperate("收藏", "images/ic_action_like_heart_grey.png"),
                  Container(
                    width: 0.5,
                    height: 20,
                    color: Colors.grey[350],
                  ),
                  buildOperate("缓存", "images/icon_download.png")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 0.5,
              color: Colors.grey[350],
            ),
            Container(
              child: Text(items[0]),
              alignment: Alignment.center,
              height: 50,
            ),
            Container(
              child: Text(items[1]),
              alignment: Alignment.center,
              height: 50,
            ),
            Container(
              child: Text(items[2]),
              alignment: Alignment.center,
              height: 50,
            ),
            Container(
              child: Text(items[3]),
              alignment: Alignment.center,
              height: 50,
            ),
            Container(
              child: Text(items[4]),
              alignment: Alignment.center,
              height: 50,
            ),
            Container(
              child: Text(items[5]),
              alignment: Alignment.center,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOperate(String title, String iconPath) {
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            iconPath,
            width: 22,
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(title),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
