import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_openeye/public.dart';
import 'package:sprintf/sprintf.dart';

class FollowCardVideoItem extends StatelessWidget {
  String backgroundImageUrl;
  int duration;
  String imgUrl;
  String title;
  String dec;

  FollowCardVideoItem(this.backgroundImageUrl, this.duration, this.imgUrl,
      this.title, this.dec);

  @override
  Widget build(BuildContext context) {
    var time = "";
    if (duration < 60) {
      time = sprintf("%02d", [(duration % 60).toInt()]);
    } else if (duration < 3600) {
      time = sprintf("%02d:%02d", [duration ~/ 60, (duration % 60).toInt()]);
    }

    return Container(
      height: 296,
      padding: EdgeInsets.only(left: 12, right: 12, top: 15),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                child: Hero(
                  child: CachedNetworkImage(
                    imageUrl: backgroundImageUrl.replaceAll(
                        "quality/60", "quality/10!"),
                    width: double.maxFinite,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  tag: backgroundImageUrl,
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
                    time,
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
                    backgroundImage: CachedNetworkImageProvider(
                        imgUrl.replaceAll("60/format/jpg", "10/format/webp")),
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
                        title,
                        maxLines: 1,
                        style: TextStyle(color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        dec,
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