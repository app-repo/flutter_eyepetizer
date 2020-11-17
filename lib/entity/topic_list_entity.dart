/// itemList : [{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":420,"title":"脑洞剧场｜如果有机会选择，你会如何处理自己的遗体呢？","joinCount":295,"viewCount":3127,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=420","imageUrl":"http://img.kaiyanapp.com/38e24bd602a42abe72e8abf72e430592.jpeg?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1606542425000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":419,"title":"影迷俱乐部｜用一部电影或者一部剧来形容你自己的 2020","joinCount":311,"viewCount":3841,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=419","imageUrl":"http://img.kaiyanapp.com/7408711bd13fb3b5fa11c42c30c8af72.png?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1609411472000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":418,"title":"回忆杀｜童年最让你怀念的一个卡带游戏是什么呢？","joinCount":160,"viewCount":3767,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=418","imageUrl":"http://img.kaiyanapp.com/1a2f1c989a9f4a953651c4e44abd7cb7.png?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1606384426000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":417,"title":"凡尔赛文学模仿大赛｜今晚，一人一句凡尔赛文学","joinCount":691,"viewCount":6617,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=417","imageUrl":"http://img.kaiyanapp.com/21c76ec376cabcf37be7848a7b0c217f.png?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1606217871000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":416,"title":"在 2020 哪件事情最值得你铭记？","joinCount":688,"viewCount":7632,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=416","imageUrl":"http://img.kaiyanapp.com/011d19f12147dd2448c98e273a0a5bbf.jpeg?imageMogr2/quality/60/format/jpg","haveReward":false,"ifNewest":true,"newestEndTime":1609486355000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":415,"title":"男孩子们，你最想收到的礼物是什么？","joinCount":1046,"viewCount":9351,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=415","imageUrl":"http://img.kaiyanapp.com/09f546af798a744e8400b6bcebb07346.jpeg?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1606470933000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":412,"title":"你最想进入到哪个游戏世界？并成为当中的哪个主角？","joinCount":383,"viewCount":7339,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=412","imageUrl":"http://img.kaiyanapp.com/5a003286e5437d3f7e1ae20693f76773.png?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1606295713000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":411,"title":"Happy Halloween（赠魔法书） ｜如果有机会，你最想拥有什么魔法？","joinCount":744,"viewCount":10142,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=411","imageUrl":"http://img.kaiyanapp.com/703939a3f4e71a2fcf68137fdbab9f45.png?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1605771524000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":410,"title":"周五脑洞剧场（赠书） | 以「重生后，启动我的复仇计划」开始","joinCount":605,"viewCount":9988,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=410","imageUrl":"http://img.kaiyanapp.com/642752796c2c6946d4149554fe15e271.png?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1606385733000},"trackingData":null,"tag":null,"id":0,"adIndex":-1},{"type":"squareCardOfTopic","data":{"dataType":"SquareTopicCard","id":409,"title":"人生回答机（赠书）｜ 成年后，你还能找到可以交心的朋友吗？","joinCount":1093,"viewCount":12102,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=409","imageUrl":"http://img.kaiyanapp.com/fafc42e73bab29549aad9c40ae14177f.png?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1605178986000},"trackingData":null,"tag":null,"id":0,"adIndex":-1}]
/// count : 10
/// total : 0
/// nextPageUrl : "http://baobab.kaiyanapp.com/api/v7/topic/list?start=10&num=10"
/// adExist : false

class TopicListEntity {
  List<ItemList> itemList;
  int count;
  int total;
  String nextPageUrl;
  bool adExist;

  TopicListEntity({
      this.itemList, 
      this.count, 
      this.total, 
      this.nextPageUrl, 
      this.adExist});

  TopicListEntity.fromJson(dynamic json) {
    if (json["itemList"] != null) {
      itemList = [];
      json["itemList"].forEach((v) {
        itemList.add(ItemList.fromJson(v));
      });
    }
    count = json["count"];
    total = json["total"];
    nextPageUrl = json["nextPageUrl"];
    adExist = json["adExist"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (itemList != null) {
      map["itemList"] = itemList.map((v) => v.toJson()).toList();
    }
    map["count"] = count;
    map["total"] = total;
    map["nextPageUrl"] = nextPageUrl;
    map["adExist"] = adExist;
    return map;
  }

}

/// type : "squareCardOfTopic"
/// data : {"dataType":"SquareTopicCard","id":420,"title":"脑洞剧场｜如果有机会选择，你会如何处理自己的遗体呢？","joinCount":295,"viewCount":3127,"showHotSign":false,"actionUrl":"eyepetizer://topic/detail?id=420","imageUrl":"http://img.kaiyanapp.com/38e24bd602a42abe72e8abf72e430592.jpeg?imageMogr2/quality/60/format/jpg","haveReward":true,"ifNewest":true,"newestEndTime":1606542425000}
/// trackingData : null
/// tag : null
/// id : 0
/// adIndex : -1

class ItemList {
  String type;
  Data data;
  dynamic trackingData;
  dynamic tag;
  int id;
  int adIndex;

  ItemList({
      this.type, 
      this.data, 
      this.trackingData, 
      this.tag, 
      this.id, 
      this.adIndex});

  ItemList.fromJson(dynamic json) {
    type = json["type"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    trackingData = json["trackingData"];
    tag = json["tag"];
    id = json["id"];
    adIndex = json["adIndex"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["trackingData"] = trackingData;
    map["tag"] = tag;
    map["id"] = id;
    map["adIndex"] = adIndex;
    return map;
  }

}

/// dataType : "SquareTopicCard"
/// id : 420
/// title : "脑洞剧场｜如果有机会选择，你会如何处理自己的遗体呢？"
/// joinCount : 295
/// viewCount : 3127
/// showHotSign : false
/// actionUrl : "eyepetizer://topic/detail?id=420"
/// imageUrl : "http://img.kaiyanapp.com/38e24bd602a42abe72e8abf72e430592.jpeg?imageMogr2/quality/60/format/jpg"
/// haveReward : true
/// ifNewest : true
/// newestEndTime : 1606542425000

class Data {
  String dataType;
  int id;
  String title;
  int joinCount;
  int viewCount;
  bool showHotSign;
  String actionUrl;
  String imageUrl;
  bool haveReward;
  bool ifNewest;
  int newestEndTime;

  Data({
      this.dataType, 
      this.id, 
      this.title, 
      this.joinCount, 
      this.viewCount, 
      this.showHotSign, 
      this.actionUrl, 
      this.imageUrl, 
      this.haveReward, 
      this.ifNewest, 
      this.newestEndTime});

  Data.fromJson(dynamic json) {
    dataType = json["dataType"];
    id = json["id"];
    title = json["title"];
    joinCount = json["joinCount"];
    viewCount = json["viewCount"];
    showHotSign = json["showHotSign"];
    actionUrl = json["actionUrl"];
    imageUrl = json["imageUrl"];
    haveReward = json["haveReward"];
    ifNewest = json["ifNewest"];
    newestEndTime = json["newestEndTime"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dataType"] = dataType;
    map["id"] = id;
    map["title"] = title;
    map["joinCount"] = joinCount;
    map["viewCount"] = viewCount;
    map["showHotSign"] = showHotSign;
    map["actionUrl"] = actionUrl;
    map["imageUrl"] = imageUrl;
    map["haveReward"] = haveReward;
    map["ifNewest"] = ifNewest;
    map["newestEndTime"] = newestEndTime;
    return map;
  }

}