import 'package:flutter/material.dart';
import 'package:flutter_openeye/config/routes.dart';
import 'package:flutter_openeye/entity/special_topic_entity.dart';
import 'package:flutter_openeye/public.dart';

class SpecialTopicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SpecialTopicPageState();
}

class SpecialTopicPageState extends State<SpecialTopicPage> {
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
      resultMap = await HttpManager.instance.get(Constant.SPECIAL_TOPIC);
    } else {
      resultMap = await HttpManager.instance
          .get(Constant.SPECIAL_TOPIC, parameters: MapUtil.urlToMap(_nextUrl));
    }
    SpecialTopicEntity entity = SpecialTopicEntity.fromJson(resultMap);
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
    return Scaffold(
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
              onLoading: () {
                _onRequest(isRefresh: false);
              },
              child: ListView.builder(
                itemCount: _itemList.length,
                itemExtent: 200,
                itemBuilder: (c, pos) {
                  return buildItem(c, pos);
                },
              ),
            ),
    );
  }

  Widget buildItem(BuildContext c, int pos) {
    var item = _itemList[pos];

    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      child: GestureDetector(
          onTap: () => itemClick(item.data.actionUrl, item.data.id),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: CachedNetworkImage(
              imageUrl: item.data.image,
              fit: BoxFit.fill,
            ),
          )),
    );
  }

  void itemClick(String url, int id) {
    //eyepetizer://lightTopic/detail/537?title=%E4%B8%8D%E6%98%AF%E6%89%93%E5%B7%A5%E4%BA%BA%E5%B0%B1%E4%B8%8D%E8%A6%81%E7%82%B9%E8%BF%9B%E6%9D%A5%E4%BA%86
    // title=不是打工人就不要点进来了&title=不是打工人就不要点进来了
    url = url.substring(url.indexOf("?") + 1);
    List<String> params = url.split("&");
    var map = Map<String, dynamic>();
    params.forEach((str) {
      map[str.split("=")[0]] = Uri.decodeComponent(str.split("=")[1]);
    });
    map['id'] = id.toString();
    Routes.navigateTo(context, Routes.lightTopicDetailPage, params: map);
  }
}
