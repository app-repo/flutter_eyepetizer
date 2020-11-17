import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/attention_entity.dart';
import 'package:flutter_openeye/page/item/auto_play_follow_card.dart';
import 'package:flutter_openeye/page/item/picture_follow_card_item.dart';
import 'package:flutter_openeye/page/item/user_list_card_item.dart';

import '../../public.dart';

class AttentionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AttentionPageState();
}

class AttentionPageState extends State<AttentionPage>
    with AutomaticKeepAliveClientMixin {
  List<ItemList> _itemList;
  String _nextUrl = "";
  RefreshController _controller = RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemList = List();
    _onRequest();
  }

  Future<void> _onRequest({bool isRefresh = true}) async {
    var resultMap;
    if (isRefresh) {
      resultMap = await HttpManager.instance.get(Constant.COM_ATTENTION);
    } else {
      resultMap = await HttpManager.instance
          .get(Constant.COM_ATTENTION, parameters: MapUtil.urlToMap(_nextUrl));
    }
    AttentionEntity entity = AttentionEntity.fromJson(resultMap);
    _nextUrl = entity.nextPageUrl ?? "";
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
    print(type);
    switch (type) {
      case 'userListCard':
        return UserListCardPage(item.data.userList);
      case 'autoPlayFollowCard':
        return AutoPlayFollowCardPage(
            item.data.header.icon,
            item.data.content.data.description,
            item.data.content.data.title,
            item.data.content.data.consumption.replyCount.toString(),
            item.data.content.data.consumption.collectionCount.toString(),
            item.data.content.data.cover.feed,
            item.data.content.data.releaseTime,
            item.data.header.issuerName);
      case 'pictureFollowCard':
        return PicFollowCardItemPage(
            item.data.header.issuerName,
            item.data.header.icon,
            item.data.content.data.releaseTime,
            item.data.content.data.consumption.replyCount.toString(),
            item.data.content.data.title,
            item.data.content.data.consumption.collectionCount.toString(),
            item.data.content.data.description,
            item.data.content.data.urls);
      default:
        return Container();
    }
  }

  @override

  bool get wantKeepAlive => true;
}
