/// itemList : [{"type":"textCard","data":{"dataType":"TextCard","id":0,"text":"热门评论","subTitle":null,"follow":null,"videoId":222845,"videoTitle":"作为女人，该如何证明自己是女性？","parentReplyId":0,"rootReplyId":1330131602314887168,"sequence":8,"message":"检察官都是男的就离谱","replyStatus":"PUBLISHED","createTime":1605963061000,"user":{"uid":300837191,"nickname":"吸·呼","avatar":"http://img.kaiyanapp.com/c9b67703d7a0394ba9d5bf1d04a873d1.jpeg?imageMogr2/quality/60/format/jpg","userType":"NORMAL","ifPgc":false,"description":"","area":null,"gender":null,"registDate":1499186439000,"releaseDate":1582442440000,"cover":null,"actionUrl":"eyepetizer://pgc/detail/300837191/?title=%E5%90%B8%C2%B7%E5%91%BC&userType=NORMAL&tabIndex=0","followed":false,"limitVideoOpen":true,"library":"BLOCK","birthday":0,"country":null,"city":null,"university":null,"job":null,"expert":false},"likeCount":64,"liked":false,"hot":false,"userType":null,"type":"video","actionUrl":null,"imageUrl":null,"ugcVideoId":null,"parentReply":{"id":1330204100863721472,"user":{"uid":304277139,"nickname":"OkKuokuo","avatar":"http://img.kaiyanapp.com/e849b623c67fa96ec8a803a6e625a34d.png","userType":"NORMAL","ifPgc":false,"description":null,"area":null,"gender":null,"registDate":1605980317000,"releaseDate":null,"cover":null,"actionUrl":"eyepetizer://pgc/detail/304277139/?title=OkKuokuo&userType=NORMAL&tabIndex=0","followed":false,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":false},"message":"哈哈哈哈哈戴眼镜的小哥哥好好看","imageUrl":"","replyStatus":"PUBLISHED"},"showParentReply":true,"showConversationButton":false,"ugcVideoUrl":null,"cover":null,"sid":"1330131602314887168","userBlocked":false},"trackingData":null,"tag":null,"id":0,"adIndex":-1}]
/// count : 13
/// total : 25
/// nextPageUrl : "http://baobab.kaiyanapp.com/api/v2/replies/video?lastId=16&videoId=222760&num=10&type=video"
/// adExist : false

class VideoReplyEntity {
  List<ItemList> itemList;
  int count;
  int total;
  String nextPageUrl;
  bool adExist;

  VideoReplyEntity({
      this.itemList, 
      this.count, 
      this.total, 
      this.nextPageUrl, 
      this.adExist});

  VideoReplyEntity.fromJson(dynamic json) {
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

/// type : "textCard"
/// data : {"dataType":"TextCard","id":0,"text":"热门评论","subTitle":null,"follow":null,"videoId":222845,"videoTitle":"作为女人，该如何证明自己是女性？","parentReplyId":0,"rootReplyId":1330131602314887168,"sequence":8,"message":"检察官都是男的就离谱","replyStatus":"PUBLISHED","createTime":1605963061000,"user":{"uid":300837191,"nickname":"吸·呼","avatar":"http://img.kaiyanapp.com/c9b67703d7a0394ba9d5bf1d04a873d1.jpeg?imageMogr2/quality/60/format/jpg","userType":"NORMAL","ifPgc":false,"description":"","area":null,"gender":null,"registDate":1499186439000,"releaseDate":1582442440000,"cover":null,"actionUrl":"eyepetizer://pgc/detail/300837191/?title=%E5%90%B8%C2%B7%E5%91%BC&userType=NORMAL&tabIndex=0","followed":false,"limitVideoOpen":true,"library":"BLOCK","birthday":0,"country":null,"city":null,"university":null,"job":null,"expert":false},"likeCount":64,"liked":false,"hot":false,"userType":null,"type":"video","actionUrl":null,"imageUrl":null,"ugcVideoId":null,"parentReply":{"id":1330204100863721472,"user":{"uid":304277139,"nickname":"OkKuokuo","avatar":"http://img.kaiyanapp.com/e849b623c67fa96ec8a803a6e625a34d.png","userType":"NORMAL","ifPgc":false,"description":null,"area":null,"gender":null,"registDate":1605980317000,"releaseDate":null,"cover":null,"actionUrl":"eyepetizer://pgc/detail/304277139/?title=OkKuokuo&userType=NORMAL&tabIndex=0","followed":false,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":false},"message":"哈哈哈哈哈戴眼镜的小哥哥好好看","imageUrl":"","replyStatus":"PUBLISHED"},"showParentReply":true,"showConversationButton":false,"ugcVideoUrl":null,"cover":null,"sid":"1330131602314887168","userBlocked":false}
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

/// dataType : "TextCard"
/// id : 0
/// text : "热门评论"
/// subTitle : null
/// follow : null
/// videoId : 222845
/// videoTitle : "作为女人，该如何证明自己是女性？"
/// parentReplyId : 0
/// rootReplyId : 1330131602314887168
/// sequence : 8
/// message : "检察官都是男的就离谱"
/// replyStatus : "PUBLISHED"
/// createTime : 1605963061000
/// user : {"uid":300837191,"nickname":"吸·呼","avatar":"http://img.kaiyanapp.com/c9b67703d7a0394ba9d5bf1d04a873d1.jpeg?imageMogr2/quality/60/format/jpg","userType":"NORMAL","ifPgc":false,"description":"","area":null,"gender":null,"registDate":1499186439000,"releaseDate":1582442440000,"cover":null,"actionUrl":"eyepetizer://pgc/detail/300837191/?title=%E5%90%B8%C2%B7%E5%91%BC&userType=NORMAL&tabIndex=0","followed":false,"limitVideoOpen":true,"library":"BLOCK","birthday":0,"country":null,"city":null,"university":null,"job":null,"expert":false}
/// likeCount : 64
/// liked : false
/// hot : false
/// userType : null
/// type : "video"
/// actionUrl : null
/// imageUrl : null
/// ugcVideoId : null
/// parentReply : {"id":1330204100863721472,"user":{"uid":304277139,"nickname":"OkKuokuo","avatar":"http://img.kaiyanapp.com/e849b623c67fa96ec8a803a6e625a34d.png","userType":"NORMAL","ifPgc":false,"description":null,"area":null,"gender":null,"registDate":1605980317000,"releaseDate":null,"cover":null,"actionUrl":"eyepetizer://pgc/detail/304277139/?title=OkKuokuo&userType=NORMAL&tabIndex=0","followed":false,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":false},"message":"哈哈哈哈哈戴眼镜的小哥哥好好看","imageUrl":"","replyStatus":"PUBLISHED"}
/// showParentReply : true
/// showConversationButton : false
/// ugcVideoUrl : null
/// cover : null
/// sid : "1330131602314887168"
/// userBlocked : false

class Data {
  String dataType;
  int id;
  String text;
  dynamic subTitle;
  dynamic follow;
  int videoId;
  String videoTitle;
  int parentReplyId;
  int rootReplyId;
  int sequence;
  String message;
  String replyStatus;
  int createTime;
  User user;
  int likeCount;
  bool liked;
  bool hot;
  dynamic userType;
  String type;
  String actionUrl;
  dynamic imageUrl;
  dynamic ugcVideoId;
  ParentReply parentReply;
  bool showParentReply;
  bool showConversationButton;
  dynamic ugcVideoUrl;
  dynamic cover;
  String sid;
  bool userBlocked;

  Data({
      this.dataType, 
      this.id, 
      this.text, 
      this.subTitle, 
      this.follow, 
      this.videoId, 
      this.videoTitle, 
      this.parentReplyId, 
      this.rootReplyId, 
      this.sequence, 
      this.message, 
      this.replyStatus, 
      this.createTime, 
      this.user, 
      this.likeCount, 
      this.liked, 
      this.hot, 
      this.userType, 
      this.type, 
      this.actionUrl, 
      this.imageUrl, 
      this.ugcVideoId, 
      this.parentReply, 
      this.showParentReply, 
      this.showConversationButton, 
      this.ugcVideoUrl, 
      this.cover, 
      this.sid, 
      this.userBlocked});

  Data.fromJson(dynamic json) {
    dataType = json["dataType"];
    id = json["id"];
    text = json["text"];
    subTitle = json["subTitle"];
    follow = json["follow"];
    videoId = json["videoId"];
    videoTitle = json["videoTitle"];
    parentReplyId = json["parentReplyId"];
    rootReplyId = json["rootReplyId"];
    sequence = json["sequence"];
    message = json["message"];
    replyStatus = json["replyStatus"];
    createTime = json["createTime"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    likeCount = json["likeCount"];
    liked = json["liked"];
    hot = json["hot"];
    userType = json["userType"];
    type = json["type"];
    actionUrl = json["actionUrl"];
    imageUrl = json["imageUrl"];
    ugcVideoId = json["ugcVideoId"];
    parentReply = json["parentReply"] != null ? ParentReply.fromJson(json["parentReply"]) : null;
    showParentReply = json["showParentReply"];
    showConversationButton = json["showConversationButton"];
    ugcVideoUrl = json["ugcVideoUrl"];
    cover = json["cover"];
    sid = json["sid"];
    userBlocked = json["userBlocked"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dataType"] = dataType;
    map["id"] = id;
    map["text"] = text;
    map["subTitle"] = subTitle;
    map["follow"] = follow;
    map["videoId"] = videoId;
    map["videoTitle"] = videoTitle;
    map["parentReplyId"] = parentReplyId;
    map["rootReplyId"] = rootReplyId;
    map["sequence"] = sequence;
    map["message"] = message;
    map["replyStatus"] = replyStatus;
    map["createTime"] = createTime;
    if (user != null) {
      map["user"] = user.toJson();
    }
    map["likeCount"] = likeCount;
    map["liked"] = liked;
    map["hot"] = hot;
    map["userType"] = userType;
    map["type"] = type;
    map["actionUrl"] = actionUrl;
    map["imageUrl"] = imageUrl;
    map["ugcVideoId"] = ugcVideoId;
    if (parentReply != null) {
      map["parentReply"] = parentReply.toJson();
    }
    map["showParentReply"] = showParentReply;
    map["showConversationButton"] = showConversationButton;
    map["ugcVideoUrl"] = ugcVideoUrl;
    map["cover"] = cover;
    map["sid"] = sid;
    map["userBlocked"] = userBlocked;
    return map;
  }

}

/// id : 1330204100863721472
/// user : {"uid":304277139,"nickname":"OkKuokuo","avatar":"http://img.kaiyanapp.com/e849b623c67fa96ec8a803a6e625a34d.png","userType":"NORMAL","ifPgc":false,"description":null,"area":null,"gender":null,"registDate":1605980317000,"releaseDate":null,"cover":null,"actionUrl":"eyepetizer://pgc/detail/304277139/?title=OkKuokuo&userType=NORMAL&tabIndex=0","followed":false,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":false}
/// message : "哈哈哈哈哈戴眼镜的小哥哥好好看"
/// imageUrl : ""
/// replyStatus : "PUBLISHED"

class ParentReply {
  int id;
  User user;
  String message;
  String imageUrl;
  String replyStatus;

  ParentReply({
      this.id, 
      this.user, 
      this.message, 
      this.imageUrl, 
      this.replyStatus});

  ParentReply.fromJson(dynamic json) {
    id = json["id"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    message = json["message"];
    imageUrl = json["imageUrl"];
    replyStatus = json["replyStatus"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    if (user != null) {
      map["user"] = user.toJson();
    }
    map["message"] = message;
    map["imageUrl"] = imageUrl;
    map["replyStatus"] = replyStatus;
    return map;
  }

}

/// uid : 304277139
/// nickname : "OkKuokuo"
/// avatar : "http://img.kaiyanapp.com/e849b623c67fa96ec8a803a6e625a34d.png"
/// userType : "NORMAL"
/// ifPgc : false
/// description : null
/// area : null
/// gender : null
/// registDate : 1605980317000
/// releaseDate : null
/// cover : null
/// actionUrl : "eyepetizer://pgc/detail/304277139/?title=OkKuokuo&userType=NORMAL&tabIndex=0"
/// followed : false
/// limitVideoOpen : false
/// library : "BLOCK"
/// birthday : null
/// country : null
/// city : null
/// university : null
/// job : null
/// expert : false

class User {
  int uid;
  String nickname;
  String avatar;
  String userType;
  bool ifPgc;
  dynamic description;
  dynamic area;
  dynamic gender;
  int registDate;
  dynamic releaseDate;
  dynamic cover;
  String actionUrl;
  bool followed;
  bool limitVideoOpen;
  String library;
  dynamic birthday;
  dynamic country;
  dynamic city;
  dynamic university;
  dynamic job;
  bool expert;

  User({
      this.uid, 
      this.nickname, 
      this.avatar, 
      this.userType, 
      this.ifPgc, 
      this.description, 
      this.area, 
      this.gender, 
      this.registDate, 
      this.releaseDate, 
      this.cover, 
      this.actionUrl, 
      this.followed, 
      this.limitVideoOpen, 
      this.library, 
      this.birthday, 
      this.country, 
      this.city, 
      this.university, 
      this.job, 
      this.expert});

  User.fromJson(dynamic json) {
    uid = json["uid"];
    nickname = json["nickname"];
    avatar = json["avatar"];
    userType = json["userType"];
    ifPgc = json["ifPgc"];
    description = json["description"];
    area = json["area"];
    gender = json["gender"];
    registDate = json["registDate"];
    releaseDate = json["releaseDate"];
    cover = json["cover"];
    actionUrl = json["actionUrl"];
    followed = json["followed"];
    limitVideoOpen = json["limitVideoOpen"];
    library = json["library"];
    birthday = json["birthday"];
    country = json["country"];
    city = json["city"];
    university = json["university"];
    job = json["job"];
    expert = json["expert"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uid"] = uid;
    map["nickname"] = nickname;
    map["avatar"] = avatar;
    map["userType"] = userType;
    map["ifPgc"] = ifPgc;
    map["description"] = description;
    map["area"] = area;
    map["gender"] = gender;
    map["registDate"] = registDate;
    map["releaseDate"] = releaseDate;
    map["cover"] = cover;
    map["actionUrl"] = actionUrl;
    map["followed"] = followed;
    map["limitVideoOpen"] = limitVideoOpen;
    map["library"] = library;
    map["birthday"] = birthday;
    map["country"] = country;
    map["city"] = city;
    map["university"] = university;
    map["job"] = job;
    map["expert"] = expert;
    return map;
  }

}

/// uid : 300837191
/// nickname : "吸·呼"
/// avatar : "http://img.kaiyanapp.com/c9b67703d7a0394ba9d5bf1d04a873d1.jpeg?imageMogr2/quality/60/format/jpg"
/// userType : "NORMAL"
/// ifPgc : false
/// description : ""
/// area : null
/// gender : null
/// registDate : 1499186439000
/// releaseDate : 1582442440000
/// cover : null
/// actionUrl : "eyepetizer://pgc/detail/300837191/?title=%E5%90%B8%C2%B7%E5%91%BC&userType=NORMAL&tabIndex=0"
/// followed : false
/// limitVideoOpen : true
/// library : "BLOCK"
/// birthday : 0
/// country : null
/// city : null
/// university : null
/// job : null
/// expert : false
