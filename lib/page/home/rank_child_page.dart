import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/rank_child_entity.dart';
import 'package:flutter_openeye/http/http_manager.dart';
import 'package:flutter_openeye/page/item/follow_card_video_item.dart';

import '../../public.dart';

class RankChildPage extends StatefulWidget {
  int type;

  RankChildPage(this.type);

  @override
  State<StatefulWidget> createState() => RankChildPageState();
}

class RankChildPageState extends State<RankChildPage>
    with AutomaticKeepAliveClientMixin {
  List<ItemList> _itemList = List();

  String _nextUrl = "";

  RefreshController _controller = RefreshController(initialRefresh: false);
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onRequest();
  }

  Future<void> _onRequest({isRefresh = true}) async {
    var resultMap;
    if (isRefresh) {
      var paramMap = Map<String, dynamic>();
      paramMap["strategy"] = widget.type == 0
          ? "weekly"
          : widget.type == 1
              ? "monthly"
              : "historical";
      resultMap = await HttpManager.instance
          .get(Constant.RANK_LIST, parameters: paramMap);
    } else {
      resultMap = await HttpManager.instance
          .get(Constant.RANK_LIST, parameters: MapUtil.urlToMap(_nextUrl));
    }
    RankChildEntity entity = RankChildEntity.fromJson(resultMap);
    _nextUrl = entity.nextPageUrl ?? "";
    isLoading = false;
    if (isRefresh) {
      _itemList.clear();
      _itemList.addAll(entity.itemList);
      if (mounted) this.setState(() {});
      _controller.refreshCompleted();
      if (_nextUrl.isEmpty) _controller.loadNoData();
    } else {
      _itemList.addAll(entity.itemList);
      if (mounted) this.setState(() {});
      if (_nextUrl.isEmpty)
        _controller.loadNoData();
      else
        _controller.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (isLoading) {
      return Center(
        child: SpinKitFadingCircle(
            size: 35, color: Color.fromARGB(100, 67, 129, 54)),
      );
    } else
      return Scaffold(
        body: SmartRefresher(
          controller: _controller,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRequest,
          onLoading: () {
            _onRequest(isRefresh: false);
          },
          child: ListView.builder(
            itemCount: _itemList.length,
            itemExtent: 296,
            itemBuilder: (c, pos) {
              return buildItem(c, pos);
            },
          ),
        ),
      );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget buildItem(BuildContext c, int pos) {
    var item = _itemList[pos];
    return Hero(
      child: FollowCardVideoItem(
        item.data.content.data.cover.feed,
        item.data.content.data.duration,
        item.data.header.icon,
        item.data.header.title,
        item.data.header.description,
        id: item.data.content.data.id.toString(),
        vUrl: item.data.content.data.playUrl,
      ),
      tag: item.data.content.data.cover.feed,
    );
  }
}
