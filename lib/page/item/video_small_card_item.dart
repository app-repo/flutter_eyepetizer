import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';
import 'package:sprintf/sprintf.dart';

class VideoSmallCardItem extends StatelessWidget {
  String imgUrl;
  String title;
  String dec;
  int duration;

  VideoSmallCardItem(this.imgUrl, this.title, this.dec, this.duration);

  @override
  Widget build(BuildContext context) {
    var time = "";
    if (duration < 60) {
      time = sprintf("%02d", [(duration % 60).toInt()]);
    } else if (duration < 3600) {
      time = sprintf("%02d:%02d", [duration ~/ 60, (duration % 60).toInt()]);
    }
    return Container(
      height: 115,
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Hero(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imgUrl.replaceAll(
                        "quality/60", "quality/60!/thumbnail/!170x100"),
                    height: 100,
                    width: 170,
                  ),
                  tag: imgUrl,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(100, 42, 42, 42),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Text(
                    time,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            dec,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: Image.asset("images/icon_share.png"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
