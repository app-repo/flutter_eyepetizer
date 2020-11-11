import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FindPageState();
}

class FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text("FindPageState"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
