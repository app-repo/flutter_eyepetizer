import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class InformationCardItem extends StatelessWidget {
  List<String> _list;
  String imgUrl;

  InformationCardItem(this._list, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      imgUrl.replaceAll("quality/60", "quality/10!"),
                    ))),
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
              children: _list
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
