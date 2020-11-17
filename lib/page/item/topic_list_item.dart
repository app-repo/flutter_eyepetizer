import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class TopicListItemPage extends StatelessWidget {
  String img;
  String title;
  String dec;

  TopicListItemPage(this.img, this.title, this.dec);

  @override
  Widget build(BuildContext context) {
    print(ScreenUtil.getInstance().screenWidth);
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(img.replaceAll(
                              "quality/60/format/jpg",
                              "quality/20!/format/webp/thumbnail/!${ScreenUtil.getInstance().screenWidth}x")))),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Container(
                    height: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                          maxLines: 2,
                        ),
                        Text(
                          dec,
                          style: TextStyle(fontSize: 12),
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
}
