import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class InformationCardItem extends StatefulWidget {
  List<String> _list;
  String imgUrl;

  InformationCardItem(this._list, this.imgUrl);

  @override
  State<StatefulWidget> createState() => InformationCardItemState();
}

class InformationCardItemState extends State<InformationCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: widget.imgUrl,
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                color: Color.fromARGB(100, 234, 234, 234)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget._list
                  .map((e) => Text(
                        e,
                        style: TextStyle(fontSize: 15, wordSpacing: 6),
                        maxLines: 2,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
