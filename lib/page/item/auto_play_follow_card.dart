import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import '../../public.dart';

class AutoPlayFollowCardPage extends StatelessWidget {
  String icon;
  String issueName;
  String replyCount;
  String collectionCount;
  String description;
  String feed;
  String title;
  int releaseTime;

  AutoPlayFollowCardPage(
      this.icon,
      this.description,
      this.title,
      this.replyCount,
      this.collectionCount,
      this.feed,
      this.releaseTime,
      this.issueName);


  @override
  Widget build(BuildContext context) {
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
                buildItemHeader(),
                SizedBox(
                  height: 6,
                ),
                Text(
                  description,
                  maxLines: 3,
                  style: TextStyle(),
                  strutStyle: StrutStyle(leading: 0.3),
                ),
                SizedBox(
                  height: 6,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(feed
                                  .replaceAll(
                                  "60/format/jpg", "10/format/webp")),
                              fit: BoxFit.cover)),
                    ),
                    Image.asset(
                      "images/icon_play.png",
                      width: 65,
                      height: 65,
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                buildFooter(),
              ],
            ),
          )),
    );
  }

  Widget buildItemHeader() {
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
                icon,
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
                    issueName,
                    maxLines: 1,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: TimeUtil.getFriendlyTimeSpanByNow(
                            releaseTime) +
                            " 发布: ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      TextSpan(
                        text: title,
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

  Widget buildFooter() {
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
                  collectionCount.toString(),
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
                Text(replyCount.toString()),
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
}

