import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/home_find_entity.dart';
import 'package:flutter_openeye/page/item/text_card_item.dart';
import 'package:flutter_openeye/public.dart';

class SquareCardItem extends StatelessWidget {
  ItemList _itemList;

  SquareCardItem(this._itemList);

  @override
  Widget build(BuildContext context) {
    var data = _itemList.data;
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
            padding: EdgeInsets.only(left: 12, right: 12),
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
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: CachedNetworkImageProvider(data
                                      .itemList[index].data.image
                                      .replaceAll(
                                    "quality/60/format/jpg",
                                    "quality/20!/format/webp",)))),
                        ),
                        Text(
                          data.itemList[index].data.title,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
