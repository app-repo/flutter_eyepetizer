import 'package:flutter/material.dart';
import 'package:flutter_openeye/entity/attention_entity.dart';
import 'package:flutter_openeye/public.dart';

class UserListCardPage extends StatelessWidget {
  List<UserList> _list;

  UserListCardPage(this._list);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 40,
            ),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var userList = _list[index];
                return Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                    CachedNetworkImageProvider(userList.avatar),
                  ),
                  margin: EdgeInsets.only(right: 10),
                );
              },
              itemExtent: 50,
              itemCount:_list.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              child: Text(
                '全部\n关注',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                print("ddd");
              },
            ),
          )
        ],
      ),
    );
  }
}
