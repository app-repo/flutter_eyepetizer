import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';
import 'package:sprintf/sprintf.dart';

class VideoSmallCardItem extends StatefulWidget {
  String imgUrl;
  String title;
  String dec;
  int duration;

  VideoSmallCardItem(this.imgUrl, this.title, this.dec, this.duration);

  @override
  State<StatefulWidget> createState() => VideoSmallCardItemState();
}

class VideoSmallCardItemState extends State<VideoSmallCardItem> {
  @override
  Widget build(BuildContext context) {
    var time = "";
    if (widget.duration < 60) {
      time = sprintf("%02d", [(widget.duration % 60).toInt()]);
    } else if (widget.duration < 3600) {
      time = sprintf(
          "%02d:%02d", [widget.duration ~/ 60, (widget.duration % 60).toInt()]);
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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.imgUrl,
                  height: 100,
                  width: 170,
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
                      widget.title,
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
                            widget.dec,
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
