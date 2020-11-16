import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/tag_index_entity.dart';
import 'package:flutter_openeye/page/home/tag_video_content_page.dart';

import 'package:flutter_openeye/public.dart';

class TagVideoPage extends StatefulWidget {
  String title;
  String id;
  String image;

  TagVideoPage(this.title, this.id, this.image);

  @override
  State<StatefulWidget> createState() => TagVideoPageState();
}

class TagVideoPageState extends State<TagVideoPage>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = ['推荐', '广场'];
  TagIndexEntity entity;
  TabController _controller;

  List<Widget> _pages = List();

  @override
  void initState() {
    super.initState();
    _pages
      ..add(TagVideoContentPage(0, widget.id))
      ..add(TagVideoContentPage(1, widget.id));
    _controller =
        TabController(vsync: this, initialIndex: 0, length: _tabs.length);
    _onRequest();
  }

  Future<void> _onRequest() async {
    var map = Map<String, dynamic>();
    map["id"] = widget.id;
    var resultMap =
    await HttpManager.instance.get(Constant.TAG_INDEX, parameters: map);
    entity = TagIndexEntity.fromJson(resultMap);
    print(entity.toString());
    if (mounted) this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          body: TabBarView(
            controller: _controller,
            children: _pages,
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                brightness: Brightness.dark,
                expandedHeight: 210,
                pinned: true,
                floating: true,
                title: Text(widget.title),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      ConstrainedBox(
                        child: CachedNetworkImage(
                          imageUrl: widget.image,
                          fit: BoxFit.cover,
                        ),
                        constraints: BoxConstraints.expand(),
                      ),
                      ConstrainedBox(
                        child: Container(
                          padding: EdgeInsets.only(top: 40),
                          color: Color.fromARGB(140, 0, 0, 0),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              null == entity
                                  ? Container()
                                  : Text(
                                entity.tagInfo.description ?? "",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              null == entity ||
                                  entity.tagInfo.tagFollowCount == 0
                                  ? Container()
                                  : Text(
                                entity.tagInfo.tagFollowCount.toString() +
                                    "人关注 / " +
                                    entity.tagInfo.lookCount.toString() +
                                    "人参与",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        constraints: BoxConstraints.expand(),
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  child: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3.0,
                    labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    controller: _controller,
                    tabs: _tabs
                        .map((e) => Tab(
                      text: e,
                    ))
                        .toList(),
                  ),
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}