import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_find_entity.dart';
import 'package:flutter_openeye/http/constant.dart';
import 'package:flutter_openeye/http/http_manager.dart';
import 'package:flutter_openeye/page/item/brief_card_item.dart';
import 'package:flutter_openeye/page/item/columu_card_item.dart';
import 'package:flutter_openeye/page/item/scroll_card_item.dart';
import 'package:flutter_openeye/page/item/square_cart_item.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/page/item/video_small_card_item.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FindPageState();
}

class FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin {
  bool isLoading = true;

  List<ItemList> _itemList = List();

  // RefreshController _controller = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _onRequest();
  }

  Future<void> _onRequest() async {
    var resultMap = await HttpManager.instance.get(Constant.DISCOVERY);
    HomeFindEntity entity = HomeFindEntity.fromJson(resultMap);
    isLoading = false;
    _itemList.clear();
    _itemList.addAll(entity.itemList);
    if (mounted) this.setState(() {});
    // _controller.refreshCompleted();
    // _controller.loadNoData();
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
          body: RefreshIndicator(
        onRefresh: _onRequest,
        child: ListView.builder(
          itemCount: _itemList.length,
          itemBuilder: (c, i) => buildItem(c, i),
        ),
      ));
  }

  Widget buildItem(
    BuildContext c,
    int pos,
  ) {
    var item = _itemList[pos];
    var type = item.type;
    if (type == 'videoSmallCard') {
      return VideoSmallCardItem(
          item.data.cover.feed,
          item.data.title,
          item.data.category + " / " + item.data.author.name,
          item.data.duration);
    } else if (type == 'horizontalScrollCard') {
      {
        List<String> urls =
            item.data.itemList.map((e) => e.data.image).toList();
        return ScrollCardItem(urls);
      }
    } else if (type == 'specialSquareCardCollection') {
      return SquareCardItem(item);
    } else if (type == 'columnCardList') {
      return ColumnCardItem(item);
    } else if (type == 'textCard') {
      return TextCardItem(
        title: item.data.text,
        rightTitle: item.data.rightText ?? "",
        actionUrl: item.data.actionUrl ?? "",
      );
    } else if (type == 'briefCard') {
      return BriefCardItem(
        item.data.title,
        item.data.description,
        item.data.icon,
        isFollow: item.data.dataType == 'TagBriefCard'
            ? item.data.follow.followed
            : false,
        isShowAtt: item.data.dataType == 'TagBriefCard',
      );
    }
    return Container();
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
