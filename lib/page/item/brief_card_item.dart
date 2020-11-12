import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class BriefCardItem extends StatefulWidget {
  String title;
  String dec;
  String icon;
  bool isFollow = false;
  bool isShowAtt = false;

  BriefCardItem(this.title, this.dec, this.icon,
      {this.isFollow, this.isShowAtt});

  @override
  State<StatefulWidget> createState() => BriefCardItemState();
}

class BriefCardItemState extends State<BriefCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: CachedNetworkImage(
              imageUrl: widget.icon,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
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
                      widget.title,
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
                      widget.dec,
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
          widget.isShowAtt
              ? Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: widget.isFollow ? Colors.grey[200] : Colors.grey,
                        width: 1,
                      )),
                  child: Text(
                    widget.isFollow ? "已关注" : "+关注",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
