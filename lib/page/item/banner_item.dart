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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Hero(
          child: CachedNetworkImage(
            imageUrl: image.replaceAll(
                "60/format/jpg", "10/format/webp"),
            fit: BoxFit.cover,
          ),
          tag: image,
        ),
      ),
    );
  }
}
