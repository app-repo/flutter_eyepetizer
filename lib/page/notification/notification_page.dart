import 'package:flutter/material.dart';
import 'package:flutter_openeye/http/http_manager.dart';
import 'package:flutter_openeye/http/constant.dart';
import 'package:flutter_openeye/page/notification/message_page.dart';
import 'package:flutter_openeye/page/notification/push_page.dart';
import 'package:flutter_openeye/public.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationPageState();
  }
}

class NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["推送", "私信"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 80, right: 80),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelStyle: TextStyle(fontSize: 12),
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3.0,
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                controller: _tabController,
                tabs: tabs
                    .map((e) => Tab(
                          text: e,
                        ))
                    .toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [PushPage(), MessagePage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
