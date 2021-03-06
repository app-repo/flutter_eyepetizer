import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/config/routes.dart';
import 'package:flutter_openeye/entity/category_entity.dart';
import 'package:flutter_openeye/http/constant.dart';
import 'package:flutter_openeye/http/http_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///热门分类
class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin{
  bool isLoading = true;

  List<ItemList> _itemList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _itemList = List();
    onRequest();
  }

  Future<void> onRequest() async {
    var map = await HttpManager.instance.get(Constant.CATEGORY);
    isLoading = false;
    CategoryEntity entity = CategoryEntity.fromJson(map);
    _itemList.clear();
    _itemList.addAll(entity.itemList);
    if (mounted) this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
              child: SpinKitFadingCircle(
                  size: 35, color: Color.fromARGB(100, 67, 129, 54)),
            )
          : RefreshIndicator(
              onRefresh: onRequest,
              child: GridView.builder(
                itemBuilder: buildItem,
                itemCount: _itemList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: 1),
              ),
            ),
    );
  }

  Widget buildItem(BuildContext c, int index) {
    var item = _itemList[index];
    return Container(
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ConstrainedBox(
              child: CachedNetworkImage(
                imageUrl: item.data.image,
                fit: BoxFit.cover,
              ),
              constraints: BoxConstraints.expand(),
            ),
            Text(
              item.data.title ?? "",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        onTap: () {
          if (item.data.actionUrl.contains("ranklist")) {
            Routes.navigateTo(context, Routes.rankPage);
          } else if (item.data.actionUrl.contains("campaign/list")) {
            Routes.navigateTo(context, Routes.specialTopicPage);
          } else if (item.data.actionUrl.contains("tag")) {
            var url = item.data.actionUrl;
            var s = url.substring(17);
            var id = s.substring(0, s.indexOf("/"));
            url = url.substring(url.indexOf("?") + 1);
            List<String> params = url.split("&");
            var map = Map<String, dynamic>();
            params.forEach((str) {
              map[str.split("=")[0]] = Uri.decodeComponent(str.split("=")[1]);
            });
            map['id'] = id;
            map["image"] = item.data.image;
            Routes.navigateTo(context, Routes.tagVideoPage, params: map);
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
