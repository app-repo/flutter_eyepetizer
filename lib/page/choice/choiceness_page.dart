import 'package:flutter/material.dart';
import 'package:flutter_openeye/http/http_manager.dart';
import 'package:flutter_openeye/http/constant.dart';
import 'package:flutter_openeye/page/choice/category_page.dart';
import 'package:flutter_openeye/page/choice/information_page.dart';
import 'package:flutter_openeye/page/choice/push_page.dart';
import 'package:flutter_openeye/page/choice/special_topic_page.dart';
import 'package:flutter_openeye/page/choice/topic_List_page.dart';
import 'package:flutter_openeye/public.dart';

import 'message_page.dart';

class ChoicenessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChoicenessPageState();
  }
}

class ChoicenessPageState extends State<ChoicenessPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ['分类', '专题','话题', '资讯', "推送", "私信"];

  List<Widget> _pages = List();

  @override
  void initState() {
    super.initState();
    _pages
      ..add(CategoryPage())
      ..add(SpecialTopicPage())
      ..add(TopicListPage())
      ..add(InformationPage())
      ..add(PushPage())
      ..add(MessagePage());
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          appBar: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelStyle: TextStyle(fontSize: 12),
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.0,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            controller: _tabController,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
          backgroundColor: Colors.white,
          body: TabBarView(
            controller: _tabController,
            children: _pages,
          )),
    );
  }
}
