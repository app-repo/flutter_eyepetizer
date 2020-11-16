/// tabInfo : {"tabList":[{"id":-1,"name":"推荐","apiUrl":"http://baobab.kaiyanapp.com/api/v1/tag/videos?id=16","tabType":0,"nameType":0,"adTrack":null},{"id":-2,"name":"广场","apiUrl":"http://baobab.kaiyanapp.com/api/v6/tag/dynamics?id=16","tabType":0,"nameType":0,"adTrack":null}],"defaultIdx":0}
/// tagInfo : {"dataType":"TagInfo","id":16,"name":"广告","description":"为广告人的精彩创意点赞","headerImage":"http://img.kaiyanapp.com/3054658dbd559ac42c4c282e9cab7a32.jpeg?imageMogr2/quality/100","bgPicture":"http://img.kaiyanapp.com/e41e74fe73882b552de00d95d56748d2.jpeg?imageMogr2/quality/60","actionUrl":null,"recType":0,"follow":{"itemType":"tag","itemId":16,"followed":false},"tagFollowCount":61808,"tagVideoCount":23062,"tagDynamicCount":309,"childTabList":null,"lookCount":396906,"shareLinkUrl":"http://www.kaiyanapp.com/campaign/tag_square/tag_square.html?tid=16&utm_campaign=routine&utm_medium=share&pageSource=tagSquare"}

class TagIndexEntity {
  TabInfo tabInfo;
  TagInfo tagInfo;

  @override
  String toString() {
    return 'TagIndexEntity{tabInfo: $tabInfo, tagInfo: $tagInfo}';
  }

  TagIndexEntity({this.tabInfo, this.tagInfo});

  TagIndexEntity.fromJson(dynamic json) {
    tabInfo =
        json["tabInfo"] != null ? TabInfo.fromJson(json["tabInfo"]) : null;
    tagInfo =
        json["tagInfo"] != null ? TagInfo.fromJson(json["tagInfo"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (tabInfo != null) {
      map["tabInfo"] = tabInfo.toJson();
    }
    if (tagInfo != null) {
      map["tagInfo"] = tagInfo.toJson();
    }
    return map;
  }
}

/// dataType : "TagInfo"
/// id : 16
/// name : "广告"
/// description : "为广告人的精彩创意点赞"
/// headerImage : "http://img.kaiyanapp.com/3054658dbd559ac42c4c282e9cab7a32.jpeg?imageMogr2/quality/100"
/// bgPicture : "http://img.kaiyanapp.com/e41e74fe73882b552de00d95d56748d2.jpeg?imageMogr2/quality/60"
/// actionUrl : null
/// recType : 0
/// follow : {"itemType":"tag","itemId":16,"followed":false}
/// tagFollowCount : 61808
/// tagVideoCount : 23062
/// tagDynamicCount : 309
/// childTabList : null
/// lookCount : 396906
/// shareLinkUrl : "http://www.kaiyanapp.com/campaign/tag_square/tag_square.html?tid=16&utm_campaign=routine&utm_medium=share&pageSource=tagSquare"

class TagInfo {
  String dataType;
  int id;
  String name;
  String description;
  String headerImage;
  String bgPicture;
  dynamic actionUrl;
  int recType;

  @override
  String toString() {
    return 'TagInfo{dataType: $dataType, id: $id, name: $name, description: $description, headerImage: $headerImage, bgPicture: $bgPicture, actionUrl: $actionUrl, recType: $recType, follow: $follow, tagFollowCount: $tagFollowCount, tagVideoCount: $tagVideoCount, tagDynamicCount: $tagDynamicCount, childTabList: $childTabList, lookCount: $lookCount, shareLinkUrl: $shareLinkUrl}';
  }

  Follow follow;
  int tagFollowCount;
  int tagVideoCount;
  int tagDynamicCount;
  dynamic childTabList;
  int lookCount;
  String shareLinkUrl;

  TagInfo(
      {this.dataType,
      this.id,
      this.name,
      this.description,
      this.headerImage,
      this.bgPicture,
      this.actionUrl,
      this.recType,
      this.follow,
      this.tagFollowCount,
      this.tagVideoCount,
      this.tagDynamicCount,
      this.childTabList,
      this.lookCount,
      this.shareLinkUrl});

  TagInfo.fromJson(dynamic json) {
    dataType = json["dataType"];
    id = json["id"];
    name = json["name"];
    description = json["description"];
    headerImage = json["headerImage"];
    bgPicture = json["bgPicture"];
    actionUrl = json["actionUrl"];
    recType = json["recType"];
    follow = json["follow"] != null ? Follow.fromJson(json["follow"]) : null;
    tagFollowCount = json["tagFollowCount"];
    tagVideoCount = json["tagVideoCount"];
    tagDynamicCount = json["tagDynamicCount"];
    childTabList = json["childTabList"];
    lookCount = json["lookCount"];
    shareLinkUrl = json["shareLinkUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dataType"] = dataType;
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["headerImage"] = headerImage;
    map["bgPicture"] = bgPicture;
    map["actionUrl"] = actionUrl;
    map["recType"] = recType;
    if (follow != null) {
      map["follow"] = follow.toJson();
    }
    map["tagFollowCount"] = tagFollowCount;
    map["tagVideoCount"] = tagVideoCount;
    map["tagDynamicCount"] = tagDynamicCount;
    map["childTabList"] = childTabList;
    map["lookCount"] = lookCount;
    map["shareLinkUrl"] = shareLinkUrl;
    return map;
  }
}

/// itemType : "tag"
/// itemId : 16
/// followed : false

class Follow {
  String itemType;
  int itemId;
  bool followed;

  Follow({this.itemType, this.itemId, this.followed});

  Follow.fromJson(dynamic json) {
    itemType = json["itemType"];
    itemId = json["itemId"];
    followed = json["followed"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["itemType"] = itemType;
    map["itemId"] = itemId;
    map["followed"] = followed;
    return map;
  }
}

/// tabList : [{"id":-1,"name":"推荐","apiUrl":"http://baobab.kaiyanapp.com/api/v1/tag/videos?id=16","tabType":0,"nameType":0,"adTrack":null},{"id":-2,"name":"广场","apiUrl":"http://baobab.kaiyanapp.com/api/v6/tag/dynamics?id=16","tabType":0,"nameType":0,"adTrack":null}]
/// defaultIdx : 0

class TabInfo {
  List<TabList> tabList;
  int defaultIdx;

  @override
  String toString() {
    return 'TabInfo{tabList: $tabList, defaultIdx: $defaultIdx}';
  }

  TabInfo({this.tabList, this.defaultIdx});

  TabInfo.fromJson(dynamic json) {
    if (json["tabList"] != null) {
      tabList = [];
      json["tabList"].forEach((v) {
        tabList.add(TabList.fromJson(v));
      });
    }
    defaultIdx = json["defaultIdx"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (tabList != null) {
      map["tabList"] = tabList.map((v) => v.toJson()).toList();
    }
    map["defaultIdx"] = defaultIdx;
    return map;
  }
}

/// id : -1
/// name : "推荐"
/// apiUrl : "http://baobab.kaiyanapp.com/api/v1/tag/videos?id=16"
/// tabType : 0
/// nameType : 0
/// adTrack : null

class TabList {
  int id;
  String name;
  String apiUrl;
  int tabType;
  int nameType;
  dynamic adTrack;

  TabList(
      {this.id,
      this.name,
      this.apiUrl,
      this.tabType,
      this.nameType,
      this.adTrack});

  TabList.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    apiUrl = json["apiUrl"];
    tabType = json["tabType"];
    nameType = json["nameType"];
    adTrack = json["adTrack"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["apiUrl"] = apiUrl;
    map["tabType"] = tabType;
    map["nameType"] = nameType;
    map["adTrack"] = adTrack;
    return map;
  }
}
