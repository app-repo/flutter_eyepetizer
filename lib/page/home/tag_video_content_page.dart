import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/tab_video_content_entity.dart';
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
      return Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: GestureDetector(
            onTap: () => {},
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildItemHeader(item),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    item.data.content.data.description,
                    maxLines: 3,
                    style: TextStyle(),
                    strutStyle: StrutStyle(leading: 0.3),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: item.data.content.data.cover.feed
                          .replaceAll("60/format/jpg", "10/format/webp"),
                      height: 180,
                      width: ScreenUtil.getInstance().screenWidth - 24,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  buildFooter(item),
                ],
              ),
            )),
      );
    }
    return Container();
  }

  Widget buildItemHeader(ItemList item) {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: CachedNetworkImageProvider(
                item.data.header.icon,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    item.data.header.issuerName,
                    maxLines: 1,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: DateUtil.formatDateMs(
                            item.data.content.data.releaseTime,
                            format: "yyyy/MM/dd" + " 发布: "),
                        style: TextStyle(fontSize: 12),
                      ),
                      TextSpan(
                        text: item.data.content.data.title,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFooter(ItemList item) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/ic_action_like_heart_black.png",
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  item.data.content.data.consumption.collectionCount.toString(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/ic_action_comment.png",
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(item.data.content.data.consumption.replyCount.toString()),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/ic_action_collect_grey_without_padding.png",
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text("收藏"),
              ],
            ),
          ),
          Image.asset(
            "images/icon_share.png",
            width: 15,
            height: 15,
          )
        ],
      ),
    );
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
