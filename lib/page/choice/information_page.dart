import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/infomation_entity.dart';
import 'package:flutter_openeye/page/item/information_card_item.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';

import '../../public.dart';

///全部资讯
class InformationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InformationPageState();
}

class InformationPageState extends State<InformationPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _controller = RefreshController(initialRefresh: false);

  bool isLoading = true;

  List<ItemList> itemList = List();

  String _nextUrl = "";

  @override
  void initState() {
    super.initState();
    onRequest();
  }

  void onRequest({bool isRefresh = true}) async {
    var map;
    if (isRefresh) {
      map = await HttpManager.instance.get(Constant.INFORMATION_LIST);
    } else {
      map = await HttpManager.instance.get(Constant.INFORMATION_LIST,
          parameters: MapUtil.urlToMap(_nextUrl));
    }
    InformationEntity entity = InformationEntity.fromJson(map);
    _nextUrl = entity.nextPageUrl ?? "";
    isLoading = false;
    if (isRefresh) {
      itemList.clear();
      itemList.addAll(entity.itemList);
      if (mounted) this.setState(() {});
      _controller.refreshCompleted();
      if (_nextUrl.isEmpty) _controller.loadNoData();
    } else {
      itemList.addAll(entity.itemList);
      if (mounted) this.setState(() {});
      if (_nextUrl.isEmpty) {
        _controller.loadNoData();
      } else {
        _controller.loadComplete();
      }
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
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: onRequest,
          onLoading: () {
            onRequest(isRefresh: false);
          },
          child: ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (c, i) => buildItem(c, i),
          ),
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildItem(BuildContext c, int p) {
    var item = itemList[p];
    var type = item.type;
    switch (type) {
      case 'textCard':
        return TextCardItem(
          title: item.data.text,
          rightTitle: "",
          actionUrl: "",
        );
      case 'informationCard':
        return InformationCardItem(
            item.data.titleList, item.data.backgroundImage);
      default:
        return Visibility(child: Container(), visible: false,);
    }
  }}
