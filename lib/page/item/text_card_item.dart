import 'package:flutter/material.dart';

class TextCardItem extends StatefulWidget {
  String title;
  String rightTitle;

  String actionUrl;

  TextCardItem({@required this.title, this.rightTitle, this.actionUrl});

  @override
  State<StatefulWidget> createState() => TextCardItemState();
}

class TextCardItemState extends State<TextCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          widget.rightTitle.isEmpty
              ? Container()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.rightTitle,
                        style: TextStyle(
                            color: Color.fromARGB(255, 90, 149, 247),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.blueAccent,
                      size: 20,
                    )
                  ],
                )
        ],
      ),
    );
  }
}
