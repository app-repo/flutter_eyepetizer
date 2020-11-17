import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import '../../public.dart';

class PicFollowCardItemPage extends StatelessWidget {
  String icon;
  String issuerName;
  int releaseTime;
  String title;
  String description;
  List<String> urls;

  String replyCount;
  String collectionCount;

  PicFollowCardItemPage(
      this.issuerName,
      this.icon,
      this.releaseTime,
      this.replyCount,
      this.title,
      this.collectionCount,
      this.description,
      this.urls);

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
                  description.trim(),
                  maxLines: 3,
                  style: TextStyle(),
                  strutStyle: StrutStyle(leading: 0.3),
                ),
                SizedBox(
                  height: 6,
                ),
                buildPic(),
                SizedBox(
                  height: 6,
                ),
                buildFooter(),
              ],
            ),
          )),
    );
  }

  Widget buildPic() {
    print(urls[0]);
    int len = urls.length;
    if (len == 1) {
      return Container(
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(
                image: CachedNetworkImageProvider(urls[0] +
                    "?imageMogr2/quality/40!/format/webp/thumbnail/!720x"),
                fit: BoxFit.fill)),
      );
    } else if (len == 2) {
      return Container(
        height: 180,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6)),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(urls[0] +
                            "?imageMogr2/quality/40!/format/webp/thumbnail/!720x"),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6)),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(urls[1] +
                            "?imageMogr2/quality/40!/format/webp/thumbnail/!720x"),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      );
    } else if (len == 3) {
      return Container(
        height: 180,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6)),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(urls[0] +
                            "?imageMogr2/quality/40!/format/webp/thumbnail/!360x"),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                            ),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(urls[1] +
                                    "?imageMogr2/quality/40!/format/webp/thumbnail/!360x"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(6)),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(urls[2] +
                                    "?imageMogr2/quality/40!/format/webp/thumbnail/!360x"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
                flex: 1)
          ],
        ),
      );
    } else if (len >= 4) {
      return Container(
        height: 180,
        child: Row(
          children: [
            Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                            ),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(urls[0] +
                                    "?imageMogr2/quality/40!/format/webp/thumbnail/!360x"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6)),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(urls[1] +
                                    "?imageMogr2/quality/40!/format/webp/thumbnail/!360x"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
                flex: 1),
            SizedBox(
              width: 2,
            ),
            Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                            ),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(urls[2] +
                                    "?imageMogr2/quality/40!/format/webp/thumbnail/!360x"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(6)),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(urls[3] +
                                    "?imageMogr2/quality/40!/format/webp/thumbnail/!360x"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
                flex: 1)
          ],
        ),
      );
    }
    return Container();
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
                    issuerName,
                    maxLines: 1,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: TimeUtil.getFriendlyTimeSpanByNow(releaseTime) +
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
