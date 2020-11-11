import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/private_message_entity.dart';
import 'package:flutter_openeye/http/constant.dart';
import 'package:flutter_openeye/http/http_manager.dart';
import 'package:flutter_openeye/page/notification/message_item.dart';
import 'package:flutter_openeye/public.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _controller = RefreshController(initialRefresh: false);

  bool isLoading = true;

  List<Item> itemList = List();

  String _nextUrl = "";

  @override
  void initState() {
    super.initState();
    onRequest();
  }

  void onRequest({bool isRefresh = true}) async {
    var map;
    if (isRefresh) {
      map = await HttpManager.instance.get(Constant.PRIVATE_MESSAGE);
    } else {
      map = await HttpManager.instance.get(Constant.PRIVATE_MESSAGE,
          parameters: MapUtil.urlToMap(_nextUrl));
    }
    PrivateMessageEntity entity = PrivateMessageEntity.fromJson(map);
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
      if (_nextUrl.isEmpty) {
        _controller.loadNoData();
      } else {
        _controller.loadComplete();
      }
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
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: onRequest,
          onLoading: () {
            onRequest(isRefresh: false);
          },
          child: ListView.separated(
            itemCount: itemList.length,
            itemBuilder: (c, i) => buildItem(c, i),
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(left: 60, right: 12),
                child: Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildItem(BuildContext c, int p) {
    Item item = itemList[p];
    return MessageItemWidget(
        title: item.data.user.nickname,
        imgUrl: item.data.user.avatar,
        content: item.data.content,
        date: item.data.lastTime);
  }
}
