import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class BannerItem extends StatefulWidget {
  String image;

  BannerItem(this.image);

  @override
  State<StatefulWidget> createState() => BannerItemState();
}

class BannerItemState extends State<BannerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedNetworkImage(imageUrl: widget.image, fit: BoxFit.cover,),
      ),
    );
  }

}