import 'package:fijkplayer/fijkplayer.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/video_detail_entity.dart';
import 'package:flutter_openeye/entity/video_related_entity.dart'
    as RelatedEntity;
import 'package:flutter_openeye/entity/video_reply_entity.dart';
import 'package:flutter_openeye/page/item/reply_video_item.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/page/item/video_small_card_item.dart';
import 'package:flutter_openeye/widget/custom_fijkplayer_bottom.dart';

import '../../public.dart';

class VideoDetailPage extends StatefulWidget {
  String _id;
  String vUrl;
  String bgUrl;

  VideoDetailPage(this._id, this.vUrl,this.bgUrl);

  @override
  State<StatefulWidget> createState() => VideoDetailPageState();
}

class VideoDetailPageState extends State<VideoDetailPage>
    with WidgetsBindingObserver {
  final FijkPlayer _player = FijkPlayer();
  List<ItemList> _itemList = List();
  List<RelatedEntity.ItemList> _list = List();
  String _nextUrl = "";
  bool isLoading = true;
  RefreshController _controller = RefreshController(initialRefresh: false);

  VideoDetailEntity _detailEntity;

  bool isShowAll = false;

  @override
  void initState() {
    _player.setDataSource(widget.vUrl, autoPlay: true);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _onRequest();
  }

  Future<void> _onRequest({bool isRefresh = true}) async {
    var resultMap;
    if (isRefresh) {
      var paramMap = Map<String, dynamic>();
      paramMap['type'] = 'video';
      paramMap['videoId'] = widget._id;
      resultMap = await HttpManager.instance
          .get(Constant.REPLY_VIDEO, parameters: paramMap);

      var map = await HttpManager.instance
          .get(Constant.VIDEO_INDEX + "/${widget._id}?${Constant.PARAMS}");
      _detailEntity = VideoDetailEntity.fromJson(map);

      var pMap = Map<String, dynamic>();
      pMap['id'] = widget._id;
      var rMap = await HttpManager.instance
          .get(Constant.VIDEO_RELATED, parameters: pMap);
      RelatedEntity.VideoRelatedEntity _relatedEntity =
          RelatedEntity.VideoRelatedEntity.fromJson(rMap);
      _relatedEntity.itemList.forEach((element) {
        if (element.type == 'videoSmallCard') {
          _list.add(element);
        }
      });
    } else {
      resultMap = await HttpManager.instance
          .get(Constant.REPLY_VIDEO, parameters: MapUtil.urlToMap(_nextUrl));
    }
    VideoReplyEntity entity = VideoReplyEntity.fromJson(resultMap);
    _nextUrl = entity.nextPageUrl ?? "";
    isLoading = false;
    if (isRefresh) {
      _itemList.clear();
      _itemList
        ..add(null)
        ..addAll(entity.itemList);
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
    return Scaffold(
        body: Container(
            child: Stack(
      children: [
        CachedNetworkImage(
            height: ScreenUtil.getInstance().screenHeight,
            fit: BoxFit.fill,
            imageUrl: _detailEntity != null
                ? _detailEntity.cover.blurred
                    .replaceAll("60/format/jpg", "10/format/webp")
                : ""),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: widget.vUrl,
              child: Container(
                height: 200,
                child: FijkView(
                  player: _player,
                  fit: FijkFit.fill,
                  cover: CachedNetworkImageProvider(widget.bgUrl
                          .replaceAll("60/format/jpg", "10/format/webp")),
                  panelBuilder: (FijkPlayer player, FijkData data,
                      BuildContext context, Size viewSize, Rect texturePos) {
                    return CustomFijkWidgetBottom(
                        player: player,
                        buildContext: context,
                        viewSize: viewSize,
                        texturePos: texturePos);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: isLoading
                  ? Center(
                      child: SpinKitFadingCircle(
                          size: 35, color: Color.fromARGB(100, 67, 129, 54)),
                    )
                  : SmartRefresher(
                      controller: _controller,
                      enablePullDown: false,
                      enablePullUp: true,
                      onRefresh: () {},
                      onLoading: () {
                        _onRequest(isRefresh: false);
                      },
                      child: ListView.builder(
                        itemCount: _itemList.length,
                        itemBuilder: (c, pos) {
                          if (pos == 0) {
                            return buildItemHeader(c, pos);
                          }
                          return buildItem(c, pos);
                        },
                      ),
                    ),
            )
          ],
        )
      ],
    )));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); //移除监听页面可见与不可见状态
    super.dispose();
    _player.release();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //AppLifecycleState当前页面的状态(是否可见)
    if (state == AppLifecycleState.paused) {
      //页面不可见时,暂停视频
      _player.pause();
    }
  }

  Widget buildItemHeader(BuildContext c, int pos) {
    return _detailEntity == null
        ? Container()
        : Container(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _detailEntity.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "#${_detailEntity.category} / 开眼精选",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  _detailEntity.description,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        "images/icon_heart_white.png",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          _detailEntity.consumption.collectionCount.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Image.asset(
                        "images/icon_share_white.png",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          _detailEntity.consumption.shareCount.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Image.asset(
                        "images/icon_down_white.png",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "缓存",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Image.asset(
                        "images/icon_collect_white.png",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "收藏",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: CachedNetworkImageProvider(
                              _detailEntity == null
                                  ? ""
                                  : _detailEntity.author.icon.replaceAll(
                                      "60/format/jpg", "10/format/webp")),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _detailEntity == null
                                  ? ""
                                  : _detailEntity.author.name,
                              maxLines: 1,
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              _detailEntity == null
                                  ? ""
                                  : _detailEntity.author.description,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _list.isEmpty
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: isShowAll
                            ? _list
                                .map((e) => VideoSmallCardItem(
                                      e.data.cover.feed,
                                      e.data.title,
                                      "#${e.data.category} / 开眼精选",
                                      e.data.duration,
                                      isZero: true,
                                    ))
                                .toList()
                            : _list
                                .take(3)
                                .map((e) => VideoSmallCardItem(
                                      e.data.cover.feed,
                                      e.data.title,
                                      "#${e.data.category} / 开眼精选",
                                      e.data.duration,
                                      isZero: true,
                                    ))
                                .toList(),
                      ),
                isShowAll
                    ? Container()
                    : Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            isShowAll = true;
                            this.setState(() {});
                          },
                          child: Text(
                            '显示更多',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
              ],
            ),
          );
  }

  Widget buildItem(BuildContext c, int pos) {
    var item = _itemList[pos];
    var type = item.type;
    var actionUrl = item.data.actionUrl ?? "";
    switch (type) {
      case 'textCard':
        return TextCardItem(
          title: item.data.text,
          rightTitle: actionUrl.isEmpty ? "" : "查看全部",
          actionUrl: actionUrl,
          isLight: true,
        );
      case 'reply':
        return ReplyVideoItem(item);
      default:
        return Container();
    }
  }
}
