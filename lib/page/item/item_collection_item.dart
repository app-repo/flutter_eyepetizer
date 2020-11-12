import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/com_rec_entity.dart';


class ItemCollectionItem extends StatefulWidget {
  ItemList _item;

  ItemCollectionItem(this._item);

  @override
  State<StatefulWidget> createState() => ItemCollectionItemState();
}

class ItemCollectionItemState extends State<ItemCollectionItem> {
  @override
  Widget build(BuildContext context) {
    var data = widget._item.data;
    var ratio = 90 / ((MediaQuery.of(context).size.width - 24 - 5) / 2);
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
      height: 100,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 90,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: data.itemList[index].data.bgPicture,
                      fit: BoxFit.fill,
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
            crossAxisCount: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: ratio),
      ),
    );
  }
}
