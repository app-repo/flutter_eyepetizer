import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_find_entity.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/public.dart';

class ColumnCardItem extends StatefulWidget {
  ItemList _item;

  ColumnCardItem(this._item);

  @override
  State<StatefulWidget> createState() => ColumnCardItemState();
}

class ColumnCardItemState extends State<ColumnCardItem> {
  @override
  Widget build(BuildContext context) {
    var data = widget._item.data;
    var ratio = (205 / 2) / ((MediaQuery.of(context).size.width - 24 - 5) / 2);
    return Container(
      height: 280,
      child: Column(
        children: [
          TextCardItem(
            title: data.header.title,
            rightTitle: data.header.rightText,
            actionUrl: data.header.actionUrl,
          ),
          Container(
            height: 210,
            margin: EdgeInsets.only(left: 12, right: 12),
            child: Expanded(
              flex: 1,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints.expand(),
                          child: ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl: data.itemList[index].data.image,
                              fit: BoxFit.fill,
                              // width:
                              //     (MediaQuery.of(context).size.width - 24 - 5) /
                              //         2,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        Container(
                          child: Text(
                            data.itemList[index].data.title,
                            style: TextStyle(color: Colors.white),
                            maxLines: 1,
                          ),
                          padding: EdgeInsets.only(left: 10, right: 10),
                        )
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: ratio),
              ),
            ),
          )
        ],
      ),
    );
  }
}
