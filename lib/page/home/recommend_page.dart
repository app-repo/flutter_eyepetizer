import 'package:flutter/material.dart';
import 'package:flutter_openeye/public.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecommendPageState();
}

class RecommendPageState extends State<RecommendPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text("RecommendPage"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
