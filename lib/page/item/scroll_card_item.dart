import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_find_entity.dart';
import 'package:flutter_openeye/public.dart';

class ScrollCardItem extends StatefulWidget {
  List<String> urls;

  ScrollCardItem(this.urls);

  @override
  State<StatefulWidget> createState() => ScrollCardItemState();
}

class ScrollCardItemState extends State<ScrollCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 10),
      child: Swiper(
        itemCount: widget.urls.length,
        loop: true,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        widget.urls[index],
                      ))));
        },
      ),
    );
  }
}
