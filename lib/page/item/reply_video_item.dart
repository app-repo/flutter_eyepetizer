import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/video_reply_entity.dart';

import '../../public.dart';

class ReplyVideoItem extends StatelessWidget {
  ItemList _itemList;

  ReplyVideoItem(this._itemList);

  @override
  Widget build(BuildContext context) {
    bool isParent = _itemList.data.parentReply != null;
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: CachedNetworkImageProvider(_itemList
                  .data.user.avatar
                  .replaceAll("60/format/jpg", "10/format/webp")),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _itemList.data.user.nickname,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Visibility(
                  visible: _itemList.data.parentReply != null,
                  child: Text(
                    "回复 @${_itemList.data.parentReply == null ? "" : _itemList.data.parentReply.user.nickname}",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(_itemList.data.message,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                isParent
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.black26),
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: CachedNetworkImageProvider(
                                    _itemList.data.parentReply.user.avatar
                                        .replaceAll(
                                            "60/format/jpg", "10/format/webp")),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    _itemList.data.parentReply.user.nickname,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(_itemList.data.parentReply.message,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isParent
                          ? GestureDetector(
                              onTap: () {},
                              child: Text(
                                "查看对话",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : SizedBox(),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          child: Text(
                            "回复",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          padding: EdgeInsets.only(left: isParent ? 12 : 0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          child: Text(
                            "分享",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          padding: EdgeInsets.only(left: 12),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          TimeUtil.getFriendlyTimeSpanByNow(
                              _itemList.data.createTime),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Image.asset(
                        "images/icon_reply_more_white.png",
                        width: 20,
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
