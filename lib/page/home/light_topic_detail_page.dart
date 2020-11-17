import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/light_topic_internal_entity.dart';
import 'package:flutter_openeye/page/item/auto_play_follow_card.dart';
import 'package:flutter_openeye/public.dart';

class LightTopicDetailPage extends StatefulWidget {
  String title;
  String id;

  LightTopicDetailPage(this.title, this.id);

  @override
  State<StatefulWidget> createState() => LightTopicDetailPageState();
}

class LightTopicDetailPageState extends State<LightTopicDetailPage> {
  bool isLoading = true;

  List<ItemList> _itemList;
  RefreshController _controller = RefreshController(initialRefresh: false);

  LightTopicInternalEntity entity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemList = List();
    _onRequest();
  }

  Future<void> _onRequest() async {
    var resultMap = await HttpManager.instance
        .get(Constant.LIGHT_TOPIC_INTERNAL + widget.id + Constant.PARAMS);
    entity = LightTopicInternalEntity.fromJson(resultMap);
    isLoading = false;
    _itemList.clear();
    _itemList
      ..add(null)
      ..addAll(entity.itemList);
    _itemList.addAll(entity.itemList);
    if (mounted) this.setState(() {});
    _controller.refreshCompleted();
    _controller.loadNoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "专题",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              child: ListView.separated(
                itemCount: _itemList.length,
                itemBuilder: (c, pos) {
                  if (pos == 0) {
                    return buildHeader();
                  }
                  return buildItem(c, pos);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Divider(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget buildItem(BuildContext c, int pos) {
    var item = _itemList[pos];
    return AutoPlayFollowCardPage(
        item.data.header.icon,
        item.data.content.data.description,
        item.data.content.data.title,
        item.data.content.data.consumption.replyCount.toString(),
        item.data.content.data.consumption.collectionCount.toString(),
        item.data.content.data.cover.feed,
        item.data.content.data.releaseTime,
        item.data.header.issuerName);
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
                Text(item.data.content.data.consumption.collectionCount
                    .toString(),),
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

  Widget buildHeader() {
    var img = entity.headerImage;
    var brief = entity.brief;
    var dec = entity.text;
    return Container(
      height: 250,
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: img,
                    height: 180,
                    width: ScreenUtil.getInstance().screenWidth,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 25,
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 40,
                right: 40,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey[300], width: 1),
                      color: Colors.white),
                  child: Text(
                    brief,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  height: 50,
                ),
              )
            ],
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(
              dec,
              style: TextStyle(color: Colors.grey, fontSize: 10),
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: 5,
          )
        ],
      ),
    );
  }

  void _itemClick() {}
}
