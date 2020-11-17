import 'package:flutter/material.dart';
import 'package:flutter_openeye/page/home/rank_child_page.dart';

class RankPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RankPageState();
}

class RankPageState extends State<RankPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  List<String> tabs = ["周排行", "月排行", "总排行"];
  List<Widget> pages = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages..add(RankChildPage(0))..add(RankChildPage(1))..add(RankChildPage(2));
    _controller =
        TabController(vsync: this, initialIndex: 0, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
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
        centerTitle: true,
        brightness: Brightness.light,
        title: Text(
          "eyepetizer",
          style: TextStyle(color: Colors.black, fontFamily: "Lobster"),
        ),

      ),
      body: TabBarView(
        controller: _controller,
        children: pages,
      ),
    );
  }
}
