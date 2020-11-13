import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/com_rec_entity.dart';
import 'package:flutter_openeye/public.dart';

class ComColumnCardItem extends StatelessWidget {
  ItemList _item;

  ComColumnCardItem(this._item);

  @override
  Widget build(BuildContext context) {
    var data = _item.data;
    var header = data.header;
    var content = data.content;
    var type = content.type;
    var isVideo = type == 'video';
    var ratio = content.data.width.toDouble() / content.data.height.toDouble();
    var width = (ScreenUtil.getInstance().screenWidth - 5 - 24) / 2;
    var height = width / ratio;
    height = height > 200 ? 200 : height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: CachedNetworkImage(
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                    imageUrl: content.data.cover.feed + "/thumbnail/!75p"),
                borderRadius: BorderRadius.circular(6),
              ),
              isVideo
                  ? Positioned(
                      right: 10,
                      top: 10,
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset("images/icon_play.png"),
                      ),
                    )
                  : content.data.urls.length > 1
                      ? Positioned(
                          right: 10,
                          top: 10,
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset("images/muti_pic.png"),
                          ),
                        )
                      : Container(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          content.data.description.isNotEmpty
              ? Text(
                  content.data.description,
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
                )
              : Container(),
          Container(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                      header.icon,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    header.issuerName,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(content.data.consumption.collectionCount.toString()),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Image.asset(
                      "images/ic_action_favorites_grey_without_padding.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
