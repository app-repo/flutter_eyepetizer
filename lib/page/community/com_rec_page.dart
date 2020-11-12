import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/com_rec_entity.dart';
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
        body: SmartRefresher(
          controller: _controller,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRequest,
          onLoading: () {
            _onRequest(isRefresh: false);
          },
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: _itemList.length,
            itemBuilder: (BuildContext context, int index) => new Container(
                color: Colors.green,
                child: CachedNetworkImage(
                  imageUrl:
                      "http://img.kaiyanapp.com/b6ce379ab5d33d569f6970f18418d05f.jpeg?imageMogr2/quality/60/format/jpg",
                  height: 100,
                )),
            staggeredTileBuilder: (int index) {
              if (index == 0 || index == 1) {
                return new StaggeredTile.count(4, 3);
              }
              return new StaggeredTile.count(2, 3);
            },
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
      );
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
            return ScrollCardItem(urls);
          } else if (item.data.dataType == 'ItemCollection') {
            return ItemCollectionItem(item);
          }
        }
        break;
      case 'communityColumnsCard':
        break;
      default:
        return Container();
    }
  }
}
