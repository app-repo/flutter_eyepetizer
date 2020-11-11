import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_openeye/public.dart';

class FollowCardVideoItem extends StatefulWidget {
  String backgroundImageUrl;
  int duration;
  String imgUrl;
  String title;
  String dec;

  FollowCardVideoItem(this.backgroundImageUrl, this.duration, this.imgUrl,
      this.title, this.dec);

  @override
  State<StatefulWidget> createState() => FollowCardVideoItemState();
}

class FollowCardVideoItemState extends State<FollowCardVideoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 296,
      padding: EdgeInsets.only(left: 12, right: 12, top: 15),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: widget.backgroundImageUrl,
                  width: double.maxFinite,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(100, 32, 31, 31),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Text(
                    "01:12",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(widget.imgUrl),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        style: TextStyle(color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.dec,
                        maxLines: 1,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset("images/icon_share.png"),
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: 0.5,
          )
        ],
      ),
    );
  }
}
