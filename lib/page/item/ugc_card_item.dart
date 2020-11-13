import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_rec_entity.dart';
import 'package:flutter_openeye/public.dart';

class UgcCardItem extends StatelessWidget {
  List<ItemListX> _list;

  UgcCardItem(this._list);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child:Hero(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 180,
                imageUrl: _list[0].data.cover.feed.replaceAll(
                    "60/format/jpg", "10/format/webp"),
              ),
              tag: _list[0].data.cover.feed,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Hero(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: _list[1].data.cover.feed.replaceAll(
                            "60/format/jpg", "10/format/webp"),
                      ),
                      tag: _list[1].data.cover.feed,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: Hero(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: _list[2].data.cover.feed.replaceAll(
                            "60/format/jpg", "10/format/webp"),
                      ),
                      tag: _list[2].data.cover.feed,
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
