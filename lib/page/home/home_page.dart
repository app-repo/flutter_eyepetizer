import 'package:flutter/material.dart';
import 'package:flutter_openeye/page/home/attention_page.dart';
import 'package:flutter_openeye/page/home/daily_page.dart';
import 'package:flutter_openeye/page/home/find_page.dart';
import 'package:flutter_openeye/page/home/recommend_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  List<String> tabs = ["发现", "推荐", "关注"];
  List<Widget> pages = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages..add(FindPage())..add(RecommendPage())..add(AttentionPage());
    _controller =
        TabController(vsync: this, initialIndex: 0, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.calendar_today_outlined,
            color: Colors.black,
            size: 25,
          ),
          actions: [
            Icon(
              Icons.search_outlined,
              color: Colors.black,
              size: 25,
            )
          ],
          title: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            padding: EdgeInsets.only(bottom: 8),
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: 14),
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              controller: _controller,
              tabs: tabs
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList(),
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: pages,
        ),
      ),
    );
  }
}
