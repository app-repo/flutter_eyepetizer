import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class BriefCardItem extends StatelessWidget {
  String title;
  String dec;
  String icon;
  bool isFollow = false;
  bool isShowAtt = false;

  BriefCardItem(this.title, this.dec, this.icon,
      {this.isFollow, this.isShowAtt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: Hero(
              child: CachedNetworkImage(
                fadeInDuration: Duration.zero,
                imageUrl: icon.replaceAll(
                    "quality/60", "quality/60/thumbnail/!200x200"),
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              tag: icon,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dec,
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 6,
          ),
          isShowAtt
              ? Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: isFollow ? Colors.grey[200] : Colors.grey,
                        width: 1,
                      )),
                  child: Text(
                    isFollow ? "已关注" : "+关注",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
