import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          child: Stack(
            children: [
              Image.asset("images/author_account_bg.png"),
              SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            child: Image.asset("images/action_close_white.png"),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        Text(
                          "找回密码",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "images/ic_account_login_header.png",
                      width: 150,
                      height: 60,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "登录后即可关注作者、\n发表评论、同步收藏视频和播放记录",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 75, right: 75),
                    height: 40,
                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/ic_account_login_user_name.png",
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          "请输入手机号/邮箱地址",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    margin: EdgeInsets.only(top: 0, left: 75, right: 75),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 75, right: 75),
                    height: 40,
                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/ic_account_login_password.png",
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          "请输入密码",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey,
                    margin: EdgeInsets.only(top: 0, left: 75, right: 75),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 75, right: 75),
                    child: MaterialButton(
                      onPressed: () {},
                      height: 40,
                      child: Text("登录"),
                      color: Color(0xffFF8200),
                      textColor: Colors.white,
                      disabledTextColor: Colors.white,
                      disabledColor: Color(0xffFFD8AF),
                      elevation: 0,
                      disabledElevation: 0,
                      highlightElevation: 0,
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "用户注册",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "作者登录",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "images/ic_wx.png",
                            width: 50,
                            height: 50,
                          ),
                          Image.asset(
                            "images/ic_qq.png",
                            width: 50,
                            height: 50,
                          )
                        ],
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ))
            ],
          ),
          value: SystemUiOverlayStyle.dark
      ),
    );
  }
}
