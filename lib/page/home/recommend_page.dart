import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_rec_entity.dart';
import 'package:flutter_openeye/page/item/banner_item.dart';
import 'package:flutter_openeye/page/item/brief_card_item.dart';
import 'package:flutter_openeye/page/item/follow_card_video_item.dart';
import 'package:flutter_openeye/page/item/information_card_item.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/page/item/ugc_card_item.dart';
import 'package:flutter_openeye/page/item/video_small_card_item.dart';
import 'package:flutter_openeye/public.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecommendPageState();
}

class RecommendPageState extends State<RecommendPage>
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
      var params = Map<String, dynamic>();
      params["page"] = "0";
      resultMap =
          await HttpManager.instance.get(Constant.HOME_REC, parameters: params);
    } else {
      resultMap = await HttpManager.instance
          .get(Constant.HOME_REC, parameters: MapUtil.urlToMap(_nextUrl));
    }
    HomeRecEntity entity = HomeRecEntity.fromJson(resultMap);
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
            itemCount: _itemList.length,
            itemBuilder: (c, pos) {
              return buildItem(c, pos);
            },
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
      case 'textCard':
        if ("TextCardWithTagId" == item.data.dataType) {
          return Container();
        } else {
          return TextCardItem(
            title: item.data.text,
            rightTitle: item.data.rightText ?? "",
            actionUrl: item.data.actionUrl ?? "",
          );
        }
        break;
      case 'followCard':
        return FollowCardVideoItem(
            item.data.content.data.cover.feed,
            item.data.content.data.duration,
            item.data.header.icon,
            item.data.header.title,
            item.data.header.description);
        break;
      case 'informationCard':
        return InformationCardItem(
            item.data.titleList, item.data.backgroundImage);
        break;
      case 'videoSmallCard':
        return VideoSmallCardItem(
            item.data.cover.feed,
            item.data.title,
            item.data.category + " / " + item.data.author.name,
            item.data.duration);
        break;
      // case 'banner':
      //   return BannerItem(item.data.image);
      //   break;
      // case 'ugcSelectedCardCollection':
      //   if (item.data.count != 3) {
      //     return Container();
      //   }
      //   return UgcCardItem(item.data.itemList);
      //   break;
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
      default:
        return Container();
        break;
    }
  }
}
