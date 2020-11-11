import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class MessageItemWidget extends StatefulWidget {
  String title;

  String imgUrl;
  String content;
  int date;
  bool isFix = false;

  MessageItemWidget(
      {@required this.title,
      @required this.imgUrl,
      @required this.content,
      @required this.date,
      this.isFix});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageItemWidgetState();
  }
}

class MessageItemWidgetState extends State<MessageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: widget.imgUrl.isEmpty
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/ic_launcher.png"),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(widget.imgUrl),
                  ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    TimeUtil.getFriendlyTimeSpanByNow(widget.date),
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    widget.content,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
            flex: 1,
          ),
          Container(
            child: Image.asset(
              "images/ic_arrow_right.png",
              width: 20,
              height: 20,
            ),
            height: 80,
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
