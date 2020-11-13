import 'package:flutter/material.dart';
import 'package:flutter_openeye/config/routes.dart';

class TextCardItem extends StatelessWidget {
  String title;
  String rightTitle;

  String actionUrl;

  TextCardItem({@required this.title, this.rightTitle, this.actionUrl});

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
            title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          rightTitle.isEmpty
              ? Container()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTabClick(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          rightTitle,
                          style: TextStyle(
                              color: Color.fromARGB(255, 90, 149, 247),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        onTabClick(context);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.blueAccent,
                        size: 20,
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }

  void onTabClick(BuildContext context) {
    if (actionUrl.contains("categories")) {
      Routes.navigateTo(context, Routes.categoryPage);
    }
  }
}
