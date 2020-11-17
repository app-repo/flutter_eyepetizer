import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/tab_video_content_entity.dart';
import 'package:flutter_openeye/page/item/auto_play_follow_card.dart';
import 'package:flutter_openeye/page/item/follow_card_video_item.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/page/item/video_small_card_item.dart';

import '../../public.dart';

class TagVideoContentPage extends StatefulWidget {
  int type;

  String id;

  TagVideoContentPage(this.type, this.id);

  @override
  State<StatefulWidget> createState() => TagVideoContentPageState();
}

class TagVideoContentPageState extends State<TagVideoContentPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<ItemList> _itemList = List();

  String _nextUrl = "";

  RefreshController _controller = RefreshController(initialRefresh: true);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _onRequest();
  }

  Future<void> _onRequest({isRefresh = true}) async {
    var resultMap;
    if (isRefresh) {
      var paramMap = Map<String, dynamic>();
      paramMap["id"] = widget.id;
      resultMap = await HttpManager.instance.get(
          widget.type == 0 ? Constant.TAG_VIDEO : Constant.TAG_DYNAMIC,
          parameters: paramMap);
    } else {
      resultMap = await HttpManager.instance.get(
          widget.type == 0 ? Constant.TAG_VIDEO : Constant.TAG_DYNAMIC,
          parameters: MapUtil.urlToMap(_nextUrl));
    }
    TabVideoContentEntity entity = TabVideoContentEntity.fromJson(resultMap);
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
            physics: BouncingScrollPhysics(),
            itemCount: _itemList.length,
            itemBuilder: (c, pos) {
              return buildItem(c, pos);
            },
          ),
        ),
      );
  }

  Widget buildItem(BuildContext c, int pos) {
    var item = _itemList[pos];
    var type = item.type;
    if (type == 'textCard') {
      return TextCardItem(
        title: item.data.text,
        rightTitle: item.data.rightText ??
                (item.data.actionUrl == null || item.data.actionUrl.isEmpty)
            ? ""
            : "查看全部",
        actionUrl: item.data.actionUrl ?? "",
      );
    } else if ('followCard' == type) {
      return FollowCardVideoItem(
          item.data.content.data.cover.feed,
          item.data.content.data.duration,
          item.data.header.icon,
          item.data.header.title,
          item.data.header.description);
    } else if (type == 'autoPlayFollowCard') {
      return AutoPlayFollowCardPage(
          item.data.header.icon,
          item.data.content.data.description,
          item.data.content.data.title,
          item.data.content.data.consumption.replyCount.toString(),
          item.data.content.data.consumption.collectionCount.toString(),
          item.data.content.data.cover.feed,
          item.data.content.data.releaseTime,
          item.data.header.issuerName);
    }
    return Container();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
