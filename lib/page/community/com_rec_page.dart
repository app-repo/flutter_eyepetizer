import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/com_rec_entity.dart';
import 'package:flutter_openeye/page/item/community_column_card_item.dart';
import 'package:flutter_openeye/page/item/item_collection_item.dart';
import 'package:flutter_openeye/page/item/scroll_card_item.dart';

import '../../public.dart';

class ComRecPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ComRecPageState();
}

class ComRecPageState extends State<ComRecPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = true;

  List<ItemList> _itemList = List();

  String _nextUrl = "";

  RefreshController _controller = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _onRequest();
  }

  Future<void> _onRequest({bool isRefresh = true}) async {
    var resultMap;
    if (isRefresh) {
      resultMap = await HttpManager.instance.get(Constant.COM_REC);
    } else {
      resultMap = await HttpManager.instance
          .get(Constant.COM_REC, parameters: MapUtil.urlToMap(_nextUrl));
    }
    ComRecEntity entity = ComRecEntity.fromJson(resultMap);
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
          body: Container(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: SmartRefresher(
              controller: _controller,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _onRequest,
              onLoading: () {
                _onRequest(isRefresh: false);
              },
              // child: GridView.builder(
              //   itemCount: _itemList.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisSpacing: 5,
              //       mainAxisSpacing: 5,
              //       crossAxisCount: 2,
              //       childAspectRatio: 0.6),
              //   itemBuilder: buildItem,
              // )
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: _itemList.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildItem(context, index),
                staggeredTileBuilder: (int index) {
                  if (index == 0 || index == 1) {
                    return new StaggeredTile.fit(4);
                  }
                  return new StaggeredTile.fit(2);
                },
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 5.0,
              ),
            ),
          ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget buildItem(BuildContext c, int pos) {
    var item = _itemList[pos];
    var type = item.type;

    switch (type) {
      case 'horizontalScrollCard':
        {
          if (item.data.dataType == 'HorizontalScrollCard') {
            List<String> urls =
            item.data.itemList.map((e) => e.data.image).toList();
            return ScrollCardItem(
              urls,
              isPadding: false,
            );
          } else if (item.data.dataType == 'ItemCollection') {
            return ItemCollectionItem(item);
          }
          return Container();
        }
        break;
      case 'communityColumnsCard':
        return ComColumnCardItem(item);
      default:
        return Container();
    }
  }
}
