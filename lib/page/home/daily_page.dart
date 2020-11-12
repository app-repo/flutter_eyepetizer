import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/daily_entity.dart';
import 'package:flutter_openeye/page/item/follow_card_video_item.dart';
import 'package:flutter_openeye/page/item/information_card_item.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/public.dart';

class DailyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DailyPageState();
}

class DailyPageState extends State<DailyPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _controller = RefreshController(initialRefresh: false);

  bool isLoading = true;

  String _nextUrl = "";

  List<ItemList> itemList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onRequest();
  }

  void _onRequest({bool isRefresh = true}) async {
    var map;
    if (isRefresh) {
      map = await HttpManager.instance.get(Constant.DAILY);
    } else {
      var params = MapUtil.urlToMap(_nextUrl);
      map = await HttpManager.instance.get(Constant.DAILY, parameters: params);
    }
    DailyEntity entity = DailyEntity.fromJson(map);
    _nextUrl = entity.nextPageUrl ?? "";
    isLoading = false;
    if (isRefresh) {
      itemList.clear();
      itemList.addAll(entity.itemList);
      if (mounted) this.setState(() {});
      _controller.refreshCompleted();
      if (_nextUrl.isEmpty) _controller.loadNoData();
    } else {
      itemList.addAll(entity.itemList);
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
            itemCount: itemList.length,
            itemBuilder: (c, pos) => buildItem(c, pos),
          ),
        ),
      );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget buildItem(BuildContext c, int pos) {
    var item = itemList[pos];
    String type = item.type;
    if ('textCard' == type) {
      return TextCardItem(
        title: item.data.text,
        rightTitle: item.data.rightText ?? "",
        actionUrl: item.data.actionUrl ?? "",
      );
    } else if ('followCard' == type) {
      return FollowCardVideoItem(
          item.data.content.data.cover.feed,
          item.data.content.data.duration,
          item.data.header.icon,
          item.data.header.title,
          item.data.header.description);
    } else if ('informationCard' == type) {
      return InformationCardItem(
          item.data.titleList, item.data.backgroundImage);
    }else{
      return Container();
    }
  }
}
