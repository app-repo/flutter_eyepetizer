import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_find_entity.dart';
import 'package:flutter_openeye/page/item/brief_card_item.dart';
import 'package:flutter_openeye/page/item/columu_card_item.dart';
import 'package:flutter_openeye/page/item/scroll_card_item.dart';
import 'package:flutter_openeye/page/item/square_cart_item.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/page/item/video_small_card_item.dart';
import 'package:flutter_openeye/public.dart';


class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FindPageState();
}

class FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin {
  bool isLoading = true;

  List<ItemList> _itemList = List();

  RefreshController _controller = RefreshController(initialRefresh: false);

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
    _controller.refreshCompleted();
    _controller.loadNoData();
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
    // if (_itemList.length - 1 == pos) {
    //   return Container(
    //     height: 80,
    //     alignment: Alignment.center,
    //     child: Text(
    //       "-The End-",
    //       style: TextStyle(
    //           fontSize: 18, color: Colors.black, fontFamily: "Lobster"),
    //     ),
    //   );
    // }
    var item = _itemList[pos];
    var type = item.type;
    switch (type) {
      case 'horizontalScrollCard':
        {
          List<String> urls =
              item.data.itemList.map((e) => e.data.image).toList();
          return ScrollCardItem(urls);
        }
      case 'specialSquareCardCollection':
        return SquareCardItem(item);
      case 'columnCardList':
        return ColumnCardItem(item);
      case 'briefCard':
        return BriefCardItem(
          item.data.title,
          item.data.description,
          item.data.icon,
          isFollow: item.data.dataType == 'TagBriefCard'
              ? item.data.follow.followed
              : false,
          isShowAtt: item.data.dataType == 'TagBriefCard',
        );
        break;
      case 'textCard':
        return TextCardItem(
          title: item.data.text,
          rightTitle: item.data.rightText ?? "",
          actionUrl: item.data.actionUrl ?? "",
        );
        break;
      case 'videoSmallCard':
        return VideoSmallCardItem(
            item.data.cover.feed,
            item.data.title,
            item.data.category + " / " + item.data.author.name,
            item.data.duration);
        break;
      default:
        return Container();
    }
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
