import 'package:flutter/material.dart';
import 'package:flutter_openeye/page/community/com_att_page.dart';
import 'package:flutter_openeye/page/community/com_rec_page.dart';

class CommunityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommunityPageState();
  }
}

class CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  List<String> tabs = ["推荐", "关注"];
  List<Widget> pages = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages..add(ComRecPage())..add(ComAttPage());
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
          title: Container(
            margin: EdgeInsets.only(left: 80, right: 80),
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
