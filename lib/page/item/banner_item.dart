import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class BannerItem extends StatelessWidget {
  String image;

  BannerItem(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(
                image.replaceAll("quality/60/format/jpg",
                  "quality/20!/format/webp",),
              ))),
    );
  }
}
