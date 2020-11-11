import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_openeye/page/community/community_page.dart';
import 'package:flutter_openeye/page/home/home_page.dart';
import 'package:flutter_openeye/page/mine/mine_page.dart';
import 'package:flutter_openeye/page/notification/notification_page.dart';
import 'package:flutter_openeye/public.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex;

  List titles = ["首页", "社区", "通知", "我的"];
  List<Widget> pages = [
    HomePage(),
    CommunityPage(),
    NotificationPage(),
    MinePage()
  ];

  List normalIcons = [
    "images/ic_tab_strip_icon_feed.png",
    "images/ic_tab_strip_icon_follow.png",
    "images/ic_tab_strip_icon_category.png",
    "images/ic_tab_strip_icon_profile.png"
  ];
  List selectedIcons = [
    "images/ic_tab_strip_icon_feed_selected.png",
    "images/ic_tab_strip_icon_follow_selected.png",
    "images/ic_tab_strip_icon_category_selected.png",
    "images/ic_tab_strip_icon_profile_selected.png"
  ];

  List<BottomNavigationBarItem> items;

  double itemWidth;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  Image getTabNormalImg(int pos) {
    return Image.asset(
      normalIcons[pos],
      width: 34,
      height: 27,
    );
  }

  Image getTabSelectImg(int pos) {
    return Image.asset(
      selectedIcons[pos],
      width: 34,
      height: 27,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    itemWidth = (MediaQuery.of(context).size.width / 5);
    initNavigationItem();
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (pos) async {
              this.setState(() {
                _currentIndex = pos;
              });
            },
            currentIndex: _currentIndex,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            items: items,
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: pages,
          ),
        ),
        value: SystemUiOverlayStyle.dark
    );
  }

  void initNavigationItem() {
    items = [
      BottomNavigationBarItem(
          icon: getTabNormalImg(0),
          activeIcon: getTabSelectImg(0),
          title: Text(
            titles[0],
            style: TextStyle(
                color: _currentIndex == 0 ? Colors.black : Colors.black38),
          )),
      BottomNavigationBarItem(
          icon: getTabNormalImg(1),
          activeIcon: getTabSelectImg(1),
          title: Text(titles[1],
              style: TextStyle(
                  color: _currentIndex == 1 ? Colors.black : Colors.black38))),
      BottomNavigationBarItem(
          icon: getTabNormalImg(2),
          activeIcon: getTabSelectImg(2),
          title: Text(titles[2],
              style: TextStyle(
                  color: _currentIndex == 2 ? Colors.black : Colors.black38))),
      BottomNavigationBarItem(
          icon: getTabNormalImg(3),
          activeIcon: getTabSelectImg(3),
          title: Text(titles[3],
              style: TextStyle(
                  color: _currentIndex == 3 ? Colors.black : Colors.black38))),
    ];
  }

  @override
  bool get wantKeepAlive => true;
}
