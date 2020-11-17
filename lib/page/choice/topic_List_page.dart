import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/topic_list_entity.dart';
import 'package:flutter_openeye/page/item/topic_list_item.dart';

import '../../public.dart';

class TopicListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TopicListPageState();
}

class TopicListPageState extends State<TopicListPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = true;

  List<ItemList> _itemList;
  String _nextUrl = "";
  RefreshController _controller = RefreshController(initialRefresh: false);

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
      resultMap = await HttpManager.instance.get(Constant.TOPIC_LIST);
    } else {
      resultMap = await HttpManager.instance
          .get(Constant.TOPIC_LIST, parameters: MapUtil.urlToMap(_nextUrl));
    }
    TopicListEntity entity = TopicListEntity.fromJson(resultMap);
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
    return Scaffold(
      body: isLoading
          ? Center(
              child: SpinKitFadingCircle(
                  size: 35, color: Color.fromARGB(100, 67, 129, 54)),
            )
          : SmartRefresher(
              controller: _controller,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _onRequest,
              onLoading: () {
                _onRequest(isRefresh: false);
              },
              child: ListView.builder(
                itemCount: _itemList.length,
                itemExtent: 100,
                itemBuilder: (c, pos) {
                  return buildItem(c, pos);
                },
              ),
            ),
    );
  }

  Widget buildItem(BuildContext c, int pos) {
    var item = _itemList[pos];
    return TopicListItemPage(
        item.data.imageUrl,
        item.data.title,
        item.data.viewCount.toString() +
            "人浏览 / " +
            item.data.joinCount.toString() +
            "人参与");
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
