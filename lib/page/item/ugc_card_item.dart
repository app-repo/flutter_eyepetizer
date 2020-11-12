import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_rec_entity.dart';
import 'package:flutter_openeye/public.dart';

class UgcCardItem extends StatefulWidget {
  List<ItemListX> _list;

  UgcCardItem(this._list);

  @override
  State<StatefulWidget> createState() => UgcCardItemState();
}

class UgcCardItemState extends State<UgcCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(top: 10,bottom: 10),
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 180,
              imageUrl: widget._list[0].data.cover.feed,
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
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget._list[1].data.cover.feed,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget._list[2].data.cover.feed,
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
