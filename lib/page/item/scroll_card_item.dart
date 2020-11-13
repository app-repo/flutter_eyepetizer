import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_find_entity.dart';
import 'package:flutter_openeye/public.dart';

class ScrollCardItem extends StatelessWidget {
  List<String> urls;
  bool isPadding;

  ScrollCardItem(this.urls, {this.isPadding = true});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:isPadding
          ? EdgeInsets.only(left: 12, right: 12)
          : EdgeInsets.zero,
      height: 200,
      child: Swiper(
        itemCount:urls.length,
        loop: true,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                       urls[index].replaceAll("quality/60", "quality/10!"),
                      ))));
        },
      ),
    );
  }
}

