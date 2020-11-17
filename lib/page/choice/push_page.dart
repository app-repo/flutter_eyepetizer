import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/message_entity.dart';
import 'package:flutter_openeye/public.dart';
import 'package:flutter_openeye/util/map_util.dart';
import 'package:flutter_openeye/util/time_util.dart';

import 'message_item.dart';

class PushPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PushPageState();
}

class PushPageState extends State<PushPage> with AutomaticKeepAliveClientMixin {
  RefreshController _controller = RefreshController(initialRefresh: false);

  List<Message> itemList = List();

  String _nextUrl = "";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    onRequest();
  }

  void onRequest({bool isRefresh = true}) async {
    var map;
    if (isRefresh) {
      map = await HttpManager.instance.get(Constant.MESSAGE);
    } else {
      map = await HttpManager.instance
          .get(Constant.MESSAGE, parameters: MapUtil.urlToMap(_nextUrl));
    }
    MessageEntity entity = MessageEntity.fromJson(map);
    _nextUrl = entity.nextPageUrl;
    isLoading = false;
    print(_nextUrl);
    if (isRefresh) {
      itemList.clear();
      itemList.addAll(entity.messageList);
      this.setState(() {});
      _controller.refreshCompleted();
    } else {
      itemList.addAll(entity.messageList);
      this.setState(() {});
      if (null == _nextUrl) {
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
    } else {
      return Scaffold(
        body: SmartRefresher(
          enablePullDown: true,
          controller: _controller,
          enablePullUp: true,
          onRefresh: onRequest,
          onLoading: () {
            onRequest(isRefresh: false);
          },
          child: ListView.builder(
            itemCount: itemList.length,
            itemExtent:85,
            itemBuilder: (c, i) {
              return buildItem(c, i);
            },
          ),
        ),
      );
    }
  }

  Widget buildItem(BuildContext context, int pos) {
    Message msg = itemList[pos];
    return MessageItemWidget(
        title: msg.title, imgUrl: "", content: msg.content, date: msg.date, actionUrl: '',);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
