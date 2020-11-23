
class AttentionEntity {
  List<ItemList> itemList;
  int count;
  int total;
  String nextPageUrl;
  bool adExist;

  AttentionEntity({
      this.itemList, 
      this.count, 
      this.total, 
      this.nextPageUrl, 
      this.adExist});

  AttentionEntity.fromJson(dynamic json) {
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

/// type : "autoPlayFollowCard"
/// data : {"id":0,"count":-1,"actionUrl":"eyepetizer://userFollow/304200827","userList":[{"id":303914155,"nickname":"乔葵-in-wonderland","avatar":"http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg","ifPgc":false,"ifLight":true,"actionUrl":"eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0","releaseDate":1605574347000,"expert":true}],"dataType":"FollowCard","header":{"id":222958,"actionUrl":"eyepetizer://pgc/detail/1625/?title=%E5%B0%91%E5%B9%B4%E4%BC%81%E7%94%BBNEWS&userType=PGC&tabIndex=1","labelList":null,"icon":"http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg","iconType":"round","time":1605594397000,"showHateVideo":false,"followType":"author","tagId":0,"tagName":null,"issuerName":"少年企画NEWS","topShow":false},"content":{"type":"video","data":{"dataType":"VideoBeanForClient","id":222958,"title":"少年企画诚意制作 白宇|夜班飞船 篇1","description":"少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st","library":"DEFAULT","tags":[{"id":26,"name":"时尚","actionUrl":"eyepetizer://tag/26/?title=%E6%97%B6%E5%B0%9A","adTrack":null,"desc":"优雅地行走在潮流尖端","bgPicture":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","headerImage":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","tagRecType":"NORMAL","childTagList":null,"childTagIdList":null,"haveReward":false,"ifNewest":false,"newestEndTime":null,"communityIndex":0}],"consumption":{"collectionCount":0,"shareCount":0,"replyCount":0,"realCollectionCount":0},"resourceType":"video","slogan":null,"provider":{"name":"PGC","alias":"PGC","icon":""},"category":"创意","author":{"id":1625,"icon":"http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg","name":"少年企画NEWS","description":"国际化时尚视觉影像团队","link":"","latestReleaseTime":1605594397000,"videoNum":208,"adTrack":null,"follow":{"itemType":"author","itemId":1625,"followed":false},"shield":{"itemType":"author","itemId":1625,"shielded":false},"approvedNotReadyVideoCount":0,"ifPgc":true,"recSort":0,"expert":false},"cover":{"feed":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","detail":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","blurred":"http://img.kaiyanapp.com/1c02ceb03266f78363df8e3036f23b0b.jpeg?imageMogr2/quality/60/format/jpg","sharing":null,"homepage":null},"playUrl":"http://baobab.kaiyanapp.com/api/v1/playUrl?vid=222958&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=7a5bd452383b40a1804972422eef008361cf87b8","thumbPlayUrl":null,"duration":62,"webUrl":{"raw":"http://www.eyepetizer.net/detail.html?vid=222958","forWeibo":"http://www.eyepetizer.net/detail.html?vid=222958"},"releaseTime":1605594397000,"privateMessageActionUrl":"eyepetizer://privateMessage/detail?privateMessageId=-1&anotherUid=303914155&nick=%E4%B9%94%E8%91%B5-in-wonderland","url":"http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png?imageMogr2/quality/100!/format/jpg","urls":["http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png","http://img.kaiyanapp.com/3e2e33e3a9a454269831338059c3e0a1.png","http://img.kaiyanapp.com/2ed82a9122b8f159e00c9b5679110eed.png"],"status":1,"playInfo":[],"campaign":null,"waterMarks":null,"ad":false,"adTrack":[],"type":"NORMAL","titlePgc":"少年企画诚意制作 白宇|夜班飞船 篇1","descriptionPgc":"少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st","remark":"","ifLimitVideo":false,"searchWeight":0,"brandWebsiteInfo":null,"videoPosterBean":null,"idx":0,"shareAdTrack":null,"favoriteAdTrack":null,"webAdTrack":null,"date":1605594397000,"labelList":[],"descriptionEditor":"","collected":false,"reallyCollected":false,"played":false,"subtitles":[],"owner":{"uid":303914155,"nickname":"乔葵-in-wonderland","avatar":"http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg","userType":"NORMAL","ifPgc":false,"description":"","area":null,"gender":"female","registDate":1590294122000,"releaseDate":1605574347000,"cover":null,"actionUrl":"eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0","followed":true,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":true},"lastViewTime":1111},"id":0,"adIndex":-1}}

class ItemList {
  String type;
  Data data;

  ItemList({
      this.type, 
      this.data});

  ItemList.fromJson(dynamic json) {
    type = json["type"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    if (data != null) {
      map["data"] = data.toJson();
    }
    return map;
  }

}

/// id : 0
/// count : -1
/// actionUrl : "eyepetizer://userFollow/304200827"
/// userList : [{"id":303914155,"nickname":"乔葵-in-wonderland","avatar":"http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg","ifPgc":false,"ifLight":true,"actionUrl":"eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0","releaseDate":1605574347000,"expert":true}]
/// dataType : "FollowCard"
/// header : {"id":222958,"actionUrl":"eyepetizer://pgc/detail/1625/?title=%E5%B0%91%E5%B9%B4%E4%BC%81%E7%94%BBNEWS&userType=PGC&tabIndex=1","labelList":null,"icon":"http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg","iconType":"round","time":1605594397000,"showHateVideo":false,"followType":"author","tagId":0,"tagName":null,"issuerName":"少年企画NEWS","topShow":false}
/// content : {"type":"video","data":{"dataType":"VideoBeanForClient","id":222958,"title":"少年企画诚意制作 白宇|夜班飞船 篇1","description":"少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st","library":"DEFAULT","tags":[{"id":26,"name":"时尚","actionUrl":"eyepetizer://tag/26/?title=%E6%97%B6%E5%B0%9A","adTrack":null,"desc":"优雅地行走在潮流尖端","bgPicture":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","headerImage":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","tagRecType":"NORMAL","childTagList":null,"childTagIdList":null,"haveReward":false,"ifNewest":false,"newestEndTime":null,"communityIndex":0}],"consumption":{"collectionCount":0,"shareCount":0,"replyCount":0,"realCollectionCount":0},"resourceType":"video","slogan":null,"provider":{"name":"PGC","alias":"PGC","icon":""},"category":"创意","author":{"id":1625,"icon":"http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg","name":"少年企画NEWS","description":"国际化时尚视觉影像团队","link":"","latestReleaseTime":1605594397000,"videoNum":208,"adTrack":null,"follow":{"itemType":"author","itemId":1625,"followed":false},"shield":{"itemType":"author","itemId":1625,"shielded":false},"approvedNotReadyVideoCount":0,"ifPgc":true,"recSort":0,"expert":false},"cover":{"feed":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","detail":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","blurred":"http://img.kaiyanapp.com/1c02ceb03266f78363df8e3036f23b0b.jpeg?imageMogr2/quality/60/format/jpg","sharing":null,"homepage":null},"playUrl":"http://baobab.kaiyanapp.com/api/v1/playUrl?vid=222958&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=7a5bd452383b40a1804972422eef008361cf87b8","thumbPlayUrl":null,"duration":62,"webUrl":{"raw":"http://www.eyepetizer.net/detail.html?vid=222958","forWeibo":"http://www.eyepetizer.net/detail.html?vid=222958"},"releaseTime":1605594397000,"privateMessageActionUrl":"eyepetizer://privateMessage/detail?privateMessageId=-1&anotherUid=303914155&nick=%E4%B9%94%E8%91%B5-in-wonderland","url":"http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png?imageMogr2/quality/100!/format/jpg","urls":["http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png","http://img.kaiyanapp.com/3e2e33e3a9a454269831338059c3e0a1.png","http://img.kaiyanapp.com/2ed82a9122b8f159e00c9b5679110eed.png"],"status":1,"playInfo":[],"campaign":null,"waterMarks":null,"ad":false,"adTrack":[],"type":"NORMAL","titlePgc":"少年企画诚意制作 白宇|夜班飞船 篇1","descriptionPgc":"少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st","remark":"","ifLimitVideo":false,"searchWeight":0,"brandWebsiteInfo":null,"videoPosterBean":null,"idx":0,"shareAdTrack":null,"favoriteAdTrack":null,"webAdTrack":null,"date":1605594397000,"labelList":[],"descriptionEditor":"","collected":false,"reallyCollected":false,"played":false,"subtitles":[],"owner":{"uid":303914155,"nickname":"乔葵-in-wonderland","avatar":"http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg","userType":"NORMAL","ifPgc":false,"description":"","area":null,"gender":"female","registDate":1590294122000,"releaseDate":1605574347000,"cover":null,"actionUrl":"eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0","followed":true,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":true},"lastViewTime":1111},"id":0,"adIndex":-1}

class Data {
  int id;
  int count;
  String actionUrl;
  List<UserList> userList;
  String dataType;
  Header header;
  Content content;

  Data({
      this.id, 
      this.count, 
      this.actionUrl, 
      this.userList, 
      this.dataType, 
      this.header, 
      this.content});

  Data.fromJson(dynamic json) {
    id = json["id"];
    count = json["count"];
    actionUrl = json["actionUrl"];
    if (json["userList"] != null) {
      userList = [];
      json["userList"].forEach((v) {
        userList.add(UserList.fromJson(v));
      });
    }
    dataType = json["dataType"];
    header = json["header"] != null ? Header.fromJson(json["header"]) : null;
    content = json["content"] != null ? Content.fromJson(json["content"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["count"] = count;
    map["actionUrl"] = actionUrl;
    if (userList != null) {
      map["userList"] = userList.map((v) => v.toJson()).toList();
    }
    map["dataType"] = dataType;
    if (header != null) {
      map["header"] = header.toJson();
    }
    if (content != null) {
      map["content"] = content.toJson();
    }
    return map;
  }

}

/// type : "video"
/// data : {"dataType":"VideoBeanForClient","id":222958,"title":"少年企画诚意制作 白宇|夜班飞船 篇1","description":"少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st","library":"DEFAULT","tags":[{"id":26,"name":"时尚","actionUrl":"eyepetizer://tag/26/?title=%E6%97%B6%E5%B0%9A","adTrack":null,"desc":"优雅地行走在潮流尖端","bgPicture":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","headerImage":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","tagRecType":"NORMAL","childTagList":null,"childTagIdList":null,"haveReward":false,"ifNewest":false,"newestEndTime":null,"communityIndex":0}],"consumption":{"collectionCount":0,"shareCount":0,"replyCount":0,"realCollectionCount":0},"resourceType":"video","slogan":null,"provider":{"name":"PGC","alias":"PGC","icon":""},"category":"创意","author":{"id":1625,"icon":"http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg","name":"少年企画NEWS","description":"国际化时尚视觉影像团队","link":"","latestReleaseTime":1605594397000,"videoNum":208,"adTrack":null,"follow":{"itemType":"author","itemId":1625,"followed":false},"shield":{"itemType":"author","itemId":1625,"shielded":false},"approvedNotReadyVideoCount":0,"ifPgc":true,"recSort":0,"expert":false},"cover":{"feed":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","detail":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","blurred":"http://img.kaiyanapp.com/1c02ceb03266f78363df8e3036f23b0b.jpeg?imageMogr2/quality/60/format/jpg","sharing":null,"homepage":null},"playUrl":"http://baobab.kaiyanapp.com/api/v1/playUrl?vid=222958&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=7a5bd452383b40a1804972422eef008361cf87b8","thumbPlayUrl":null,"duration":62,"webUrl":{"raw":"http://www.eyepetizer.net/detail.html?vid=222958","forWeibo":"http://www.eyepetizer.net/detail.html?vid=222958"},"releaseTime":1605594397000,"privateMessageActionUrl":"eyepetizer://privateMessage/detail?privateMessageId=-1&anotherUid=303914155&nick=%E4%B9%94%E8%91%B5-in-wonderland","url":"http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png?imageMogr2/quality/100!/format/jpg","urls":["http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png","http://img.kaiyanapp.com/3e2e33e3a9a454269831338059c3e0a1.png","http://img.kaiyanapp.com/2ed82a9122b8f159e00c9b5679110eed.png"],"status":1,"playInfo":[],"campaign":null,"waterMarks":null,"ad":false,"adTrack":[],"type":"NORMAL","titlePgc":"少年企画诚意制作 白宇|夜班飞船 篇1","descriptionPgc":"少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st","remark":"","ifLimitVideo":false,"searchWeight":0,"brandWebsiteInfo":null,"videoPosterBean":null,"idx":0,"shareAdTrack":null,"favoriteAdTrack":null,"webAdTrack":null,"date":1605594397000,"labelList":[],"descriptionEditor":"","collected":false,"reallyCollected":false,"played":false,"subtitles":[],"owner":{"uid":303914155,"nickname":"乔葵-in-wonderland","avatar":"http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg","userType":"NORMAL","ifPgc":false,"description":"","area":null,"gender":"female","registDate":1590294122000,"releaseDate":1605574347000,"cover":null,"actionUrl":"eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0","followed":true,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":true},"lastViewTime":1111}
/// id : 0
/// adIndex : -1

class Content {
  String type;
  DataX data;
  int id;
  int adIndex;

  Content({
      this.type, 
      this.data, 
      this.id, 
      this.adIndex});

  Content.fromJson(dynamic json) {
    type = json["type"];
    data = json["data"] != null ? DataX.fromJson(json["data"]) : null;
    id = json["id"];
    adIndex = json["adIndex"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["id"] = id;
    map["adIndex"] = adIndex;
    return map;
  }

}

/// dataType : "VideoBeanForClient"
/// id : 222958
/// title : "少年企画诚意制作 白宇|夜班飞船 篇1"
/// description : "少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st"
/// library : "DEFAULT"
/// tags : [{"id":26,"name":"时尚","actionUrl":"eyepetizer://tag/26/?title=%E6%97%B6%E5%B0%9A","adTrack":null,"desc":"优雅地行走在潮流尖端","bgPicture":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","headerImage":"http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100","tagRecType":"NORMAL","childTagList":null,"childTagIdList":null,"haveReward":false,"ifNewest":false,"newestEndTime":null,"communityIndex":0}]
/// consumption : {"collectionCount":0,"shareCount":0,"replyCount":0,"realCollectionCount":0}
/// resourceType : "video"
/// slogan : null
/// provider : {"name":"PGC","alias":"PGC","icon":""}
/// category : "创意"
/// author : {"id":1625,"icon":"http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg","name":"少年企画NEWS","description":"国际化时尚视觉影像团队","link":"","latestReleaseTime":1605594397000,"videoNum":208,"adTrack":null,"follow":{"itemType":"author","itemId":1625,"followed":false},"shield":{"itemType":"author","itemId":1625,"shielded":false},"approvedNotReadyVideoCount":0,"ifPgc":true,"recSort":0,"expert":false}
/// cover : {"feed":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","detail":"http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg","blurred":"http://img.kaiyanapp.com/1c02ceb03266f78363df8e3036f23b0b.jpeg?imageMogr2/quality/60/format/jpg","sharing":null,"homepage":null}
/// playUrl : "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=222958&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=7a5bd452383b40a1804972422eef008361cf87b8"
/// thumbPlayUrl : null
/// duration : 62
/// webUrl : {"raw":"http://www.eyepetizer.net/detail.html?vid=222958","forWeibo":"http://www.eyepetizer.net/detail.html?vid=222958"}
/// releaseTime : 1605594397000
/// privateMessageActionUrl : "eyepetizer://privateMessage/detail?privateMessageId=-1&anotherUid=303914155&nick=%E4%B9%94%E8%91%B5-in-wonderland"
/// url : "http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png?imageMogr2/quality/100!/format/jpg"
/// urls : ["http://img.kaiyanapp.com/fe6e19cd100d21c00de151275b20db56.png","http://img.kaiyanapp.com/3e2e33e3a9a454269831338059c3e0a1.png","http://img.kaiyanapp.com/2ed82a9122b8f159e00c9b5679110eed.png"]
/// status : 1
/// playInfo : []
/// campaign : null
/// waterMarks : null
/// ad : false
/// adTrack : []
/// type : "NORMAL"
/// titlePgc : "少年企画诚意制作 白宇|夜班飞船 篇1"
/// descriptionPgc : "少年企画诚意制作 白宇 | 夜班飞船系列影像 part.1「夜游」白色飞行日志\n夜太长 心要藏在哪里，\n梦太长 所有画面不语，\n迷失与彷徨之间，\n独自回首，“我一定会找到你。”\n由国际化创意视觉影像团队少年企画旗下导演打造，更多内容关注少年企画官方微博：@少年企画NEWS 少年企画最新偶像厂牌：@少年事务所ART1st"
/// remark : ""
/// ifLimitVideo : false
/// searchWeight : 0
/// brandWebsiteInfo : null
/// videoPosterBean : null
/// idx : 0
/// shareAdTrack : null
/// favoriteAdTrack : null
/// webAdTrack : null
/// date : 1605594397000
/// labelList : []
/// descriptionEditor : ""
/// collected : false
/// reallyCollected : false
/// played : false
/// subtitles : []
/// owner : {"uid":303914155,"nickname":"乔葵-in-wonderland","avatar":"http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg","userType":"NORMAL","ifPgc":false,"description":"","area":null,"gender":"female","registDate":1590294122000,"releaseDate":1605574347000,"cover":null,"actionUrl":"eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0","followed":true,"limitVideoOpen":false,"library":"BLOCK","birthday":null,"country":null,"city":null,"university":null,"job":null,"expert":true}
/// lastViewTime : 1111

class DataX {
  String dataType;
  int id;
  String title;
  String description;
  String library;
  List<Tags> tags;
  Consumption consumption;
  String resourceType;
  dynamic slogan;
  Provider provider;
  String category;
  Author author;
  Cover cover;
  String playUrl;
  dynamic thumbPlayUrl;
  int duration;
  WebUrl webUrl;
  int releaseTime;
  String privateMessageActionUrl;
  String url;
  List<String> urls;
  List<dynamic> playInfo;
  dynamic campaign;
  dynamic waterMarks;
  bool ad;
  List<dynamic> adTrack;
  String type;
  String titlePgc;
  String descriptionPgc;
  String remark;
  bool ifLimitVideo;
  int searchWeight;
  dynamic brandWebsiteInfo;
  dynamic videoPosterBean;
  int idx;
  dynamic shareAdTrack;
  dynamic favoriteAdTrack;
  dynamic webAdTrack;
  int date;
  List<dynamic> labelList;
  String descriptionEditor;
  bool collected;
  bool reallyCollected;
  bool played;
  List<dynamic> subtitles;
  Owner owner;
  int lastViewTime;

  DataX({
      this.dataType, 
      this.id, 
      this.title, 
      this.description, 
      this.library, 
      this.tags, 
      this.consumption, 
      this.resourceType, 
      this.slogan, 
      this.provider, 
      this.category, 
      this.author, 
      this.cover, 
      this.playUrl, 
      this.thumbPlayUrl, 
      this.duration, 
      this.webUrl, 
      this.releaseTime, 
      this.privateMessageActionUrl, 
      this.url, 
      this.urls,
      this.playInfo, 
      this.campaign, 
      this.waterMarks, 
      this.ad, 
      this.adTrack, 
      this.type, 
      this.titlePgc, 
      this.descriptionPgc, 
      this.remark, 
      this.ifLimitVideo, 
      this.searchWeight, 
      this.brandWebsiteInfo, 
      this.videoPosterBean, 
      this.idx, 
      this.shareAdTrack, 
      this.favoriteAdTrack, 
      this.webAdTrack, 
      this.date, 
      this.labelList, 
      this.descriptionEditor, 
      this.collected, 
      this.reallyCollected, 
      this.played, 
      this.subtitles, 
      this.owner, 
      this.lastViewTime});

  DataX.fromJson(dynamic json) {
    dataType = json["dataType"];
    id = json["id"];
    title = json["title"];
    description = json["description"];
    library = json["library"];
    if (json["tags"] != null) {
      tags = [];
      json["tags"].forEach((v) {
        tags.add(Tags.fromJson(v));
      });
    }
    consumption = json["consumption"] != null ? Consumption.fromJson(json["consumption"]) : null;
    resourceType = json["resourceType"];
    slogan = json["slogan"];
    provider = json["provider"] != null ? Provider.fromJson(json["provider"]) : null;
    category = json["category"];
    author = json["author"] != null ? Author.fromJson(json["author"]) : null;
    cover = json["cover"] != null ? Cover.fromJson(json["cover"]) : null;
    playUrl = json["playUrl"];
    thumbPlayUrl = json["thumbPlayUrl"];
    duration = json["duration"];
    webUrl = json["webUrl"] != null ? WebUrl.fromJson(json["webUrl"]) : null;
    releaseTime = json["releaseTime"];
    privateMessageActionUrl = json["privateMessageActionUrl"];
    url = json["url"];
    urls = json["urls"] != null ? json["urls"].cast<String>() : [];

    campaign = json["campaign"];
    waterMarks = json["waterMarks"];
    ad = json["ad"];
    type = json["type"];
    titlePgc = json["titlePgc"];
    descriptionPgc = json["descriptionPgc"];
    remark = json["remark"];
    ifLimitVideo = json["ifLimitVideo"];
    searchWeight = json["searchWeight"];
    brandWebsiteInfo = json["brandWebsiteInfo"];
    videoPosterBean = json["videoPosterBean"];
    idx = json["idx"];
    shareAdTrack = json["shareAdTrack"];
    favoriteAdTrack = json["favoriteAdTrack"];
    webAdTrack = json["webAdTrack"];
    date = json["date"];
    descriptionEditor = json["descriptionEditor"];
    collected = json["collected"];
    reallyCollected = json["reallyCollected"];
    played = json["played"];
    owner = json["owner"] != null ? Owner.fromJson(json["owner"]) : null;
    lastViewTime = json["lastViewTime"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dataType"] = dataType;
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["library"] = library;
    if (tags != null) {
      map["tags"] = tags.map((v) => v.toJson()).toList();
    }
    if (consumption != null) {
      map["consumption"] = consumption.toJson();
    }
    map["resourceType"] = resourceType;
    map["slogan"] = slogan;
    if (provider != null) {
      map["provider"] = provider.toJson();
    }
    map["category"] = category;
    if (author != null) {
      map["author"] = author.toJson();
    }
    if (cover != null) {
      map["cover"] = cover.toJson();
    }
    map["playUrl"] = playUrl;
    map["thumbPlayUrl"] = thumbPlayUrl;
    map["duration"] = duration;
    if (webUrl != null) {
      map["webUrl"] = webUrl.toJson();
    }
    map["releaseTime"] = releaseTime;
    map["privateMessageActionUrl"] = privateMessageActionUrl;
    map["url"] = url;
    map["urls"] = urls;
    if (playInfo != null) {
      map["playInfo"] = playInfo.map((v) => v.toJson()).toList();
    }
    map["campaign"] = campaign;
    map["waterMarks"] = waterMarks;
    map["ad"] = ad;
    if (adTrack != null) {
      map["adTrack"] = adTrack.map((v) => v.toJson()).toList();
    }
    map["type"] = type;
    map["titlePgc"] = titlePgc;
    map["descriptionPgc"] = descriptionPgc;
    map["remark"] = remark;
    map["ifLimitVideo"] = ifLimitVideo;
    map["searchWeight"] = searchWeight;
    map["brandWebsiteInfo"] = brandWebsiteInfo;
    map["videoPosterBean"] = videoPosterBean;
    map["idx"] = idx;
    map["shareAdTrack"] = shareAdTrack;
    map["favoriteAdTrack"] = favoriteAdTrack;
    map["webAdTrack"] = webAdTrack;
    map["date"] = date;
    if (labelList != null) {
      map["labelList"] = labelList.map((v) => v.toJson()).toList();
    }
    map["descriptionEditor"] = descriptionEditor;
    map["collected"] = collected;
    map["reallyCollected"] = reallyCollected;
    map["played"] = played;
    if (subtitles != null) {
      map["subtitles"] = subtitles.map((v) => v.toJson()).toList();
    }
    if (owner != null) {
      map["owner"] = owner.toJson();
    }
    map["lastViewTime"] = lastViewTime;
    return map;
  }

}

/// uid : 303914155
/// nickname : "乔葵-in-wonderland"
/// avatar : "http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg"
/// userType : "NORMAL"
/// ifPgc : false
/// description : ""
/// area : null
/// gender : "female"
/// registDate : 1590294122000
/// releaseDate : 1605574347000
/// cover : null
/// actionUrl : "eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0"
/// followed : true
/// limitVideoOpen : false
/// library : "BLOCK"
/// birthday : null
/// country : null
/// city : null
/// university : null
/// job : null
/// expert : true

class Owner {
  int uid;
  String nickname;
  String avatar;
  String userType;
  bool ifPgc;
  String description;
  dynamic area;
  String gender;
  int registDate;
  int releaseDate;
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

  Owner({
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

  Owner.fromJson(dynamic json) {
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

/// raw : "http://www.eyepetizer.net/detail.html?vid=222958"
/// forWeibo : "http://www.eyepetizer.net/detail.html?vid=222958"

class WebUrl {
  String raw;
  String forWeibo;

  WebUrl({
      this.raw, 
      this.forWeibo});

  WebUrl.fromJson(dynamic json) {
    raw = json["raw"];
    forWeibo = json["forWeibo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["raw"] = raw;
    map["forWeibo"] = forWeibo;
    return map;
  }

}

/// feed : "http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg"
/// detail : "http://img.kaiyanapp.com/e31113f01b9a6be83d1d1572c49385f1.png?imageMogr2/quality/60/format/jpg"
/// blurred : "http://img.kaiyanapp.com/1c02ceb03266f78363df8e3036f23b0b.jpeg?imageMogr2/quality/60/format/jpg"
/// sharing : null
/// homepage : null

class Cover {
  String feed;
  String detail;
  String blurred;
  dynamic sharing;
  dynamic homepage;

  Cover({
      this.feed, 
      this.detail, 
      this.blurred, 
      this.sharing, 
      this.homepage});

  Cover.fromJson(dynamic json) {
    feed = json["feed"];
    detail = json["detail"];
    blurred = json["blurred"];
    sharing = json["sharing"];
    homepage = json["homepage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["feed"] = feed;
    map["detail"] = detail;
    map["blurred"] = blurred;
    map["sharing"] = sharing;
    map["homepage"] = homepage;
    return map;
  }

}

/// id : 1625
/// icon : "http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg"
/// name : "少年企画NEWS"
/// description : "国际化时尚视觉影像团队"
/// link : ""
/// latestReleaseTime : 1605594397000
/// videoNum : 208
/// adTrack : null
/// follow : {"itemType":"author","itemId":1625,"followed":false}
/// shield : {"itemType":"author","itemId":1625,"shielded":false}
/// approvedNotReadyVideoCount : 0
/// ifPgc : true
/// recSort : 0
/// expert : false

class Author {
  int id;
  String icon;
  String name;
  String description;
  String link;
  int latestReleaseTime;
  int videoNum;
  dynamic adTrack;
  Follow follow;
  Shield shield;
  int approvedNotReadyVideoCount;
  bool ifPgc;
  int recSort;
  bool expert;

  Author({
      this.id, 
      this.icon, 
      this.name, 
      this.description, 
      this.link, 
      this.latestReleaseTime, 
      this.videoNum, 
      this.adTrack, 
      this.follow, 
      this.shield, 
      this.approvedNotReadyVideoCount, 
      this.ifPgc, 
      this.recSort, 
      this.expert});

  Author.fromJson(dynamic json) {
    id = json["id"];
    icon = json["icon"];
    name = json["name"];
    description = json["description"];
    link = json["link"];
    latestReleaseTime = json["latestReleaseTime"];
    videoNum = json["videoNum"];
    adTrack = json["adTrack"];
    follow = json["follow"] != null ? Follow.fromJson(json["follow"]) : null;
    shield = json["shield"] != null ? Shield.fromJson(json["shield"]) : null;
    approvedNotReadyVideoCount = json["approvedNotReadyVideoCount"];
    ifPgc = json["ifPgc"];
    recSort = json["recSort"];
    expert = json["expert"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["icon"] = icon;
    map["name"] = name;
    map["description"] = description;
    map["link"] = link;
    map["latestReleaseTime"] = latestReleaseTime;
    map["videoNum"] = videoNum;
    map["adTrack"] = adTrack;
    if (follow != null) {
      map["follow"] = follow.toJson();
    }
    if (shield != null) {
      map["shield"] = shield.toJson();
    }
    map["approvedNotReadyVideoCount"] = approvedNotReadyVideoCount;
    map["ifPgc"] = ifPgc;
    map["recSort"] = recSort;
    map["expert"] = expert;
    return map;
  }

}

/// itemType : "author"
/// itemId : 1625
/// shielded : false

class Shield {
  String itemType;
  int itemId;
  bool shielded;

  Shield({
      this.itemType, 
      this.itemId, 
      this.shielded});

  Shield.fromJson(dynamic json) {
    itemType = json["itemType"];
    itemId = json["itemId"];
    shielded = json["shielded"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["itemType"] = itemType;
    map["itemId"] = itemId;
    map["shielded"] = shielded;
    return map;
  }

}

/// itemType : "author"
/// itemId : 1625
/// followed : false

class Follow {
  String itemType;
  int itemId;
  bool followed;

  Follow({
      this.itemType, 
      this.itemId, 
      this.followed});

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

/// name : "PGC"
/// alias : "PGC"
/// icon : ""

class Provider {
  String name;
  String alias;
  String icon;

  Provider({
      this.name, 
      this.alias, 
      this.icon});

  Provider.fromJson(dynamic json) {
    name = json["name"];
    alias = json["alias"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["alias"] = alias;
    map["icon"] = icon;
    return map;
  }

}

/// collectionCount : 0
/// shareCount : 0
/// replyCount : 0
/// realCollectionCount : 0

class Consumption {
  int collectionCount;
  int shareCount;
  int replyCount;
  int realCollectionCount;

  Consumption({
      this.collectionCount, 
      this.shareCount, 
      this.replyCount, 
      this.realCollectionCount});

  Consumption.fromJson(dynamic json) {
    collectionCount = json["collectionCount"];
    shareCount = json["shareCount"];
    replyCount = json["replyCount"];
    realCollectionCount = json["realCollectionCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["collectionCount"] = collectionCount;
    map["shareCount"] = shareCount;
    map["replyCount"] = replyCount;
    map["realCollectionCount"] = realCollectionCount;
    return map;
  }

}

/// id : 26
/// name : "时尚"
/// actionUrl : "eyepetizer://tag/26/?title=%E6%97%B6%E5%B0%9A"
/// adTrack : null
/// desc : "优雅地行走在潮流尖端"
/// bgPicture : "http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100"
/// headerImage : "http://img.kaiyanapp.com/34b720d05d98c905432e9906d5b9cdf7.jpeg?imageMogr2/quality/100"
/// tagRecType : "NORMAL"
/// childTagList : null
/// childTagIdList : null
/// haveReward : false
/// ifNewest : false
/// newestEndTime : null
/// communityIndex : 0

class Tags {
  int id;
  String name;
  String actionUrl;
  dynamic adTrack;
  String desc;
  String bgPicture;
  String headerImage;
  String tagRecType;
  dynamic childTagList;
  dynamic childTagIdList;
  bool haveReward;
  bool ifNewest;
  dynamic newestEndTime;
  int communityIndex;

  Tags({
      this.id, 
      this.name, 
      this.actionUrl, 
      this.adTrack, 
      this.desc, 
      this.bgPicture, 
      this.headerImage, 
      this.tagRecType, 
      this.childTagList, 
      this.childTagIdList, 
      this.haveReward, 
      this.ifNewest, 
      this.newestEndTime, 
      this.communityIndex});

  Tags.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    actionUrl = json["actionUrl"];
    adTrack = json["adTrack"];
    desc = json["desc"];
    bgPicture = json["bgPicture"];
    headerImage = json["headerImage"];
    tagRecType = json["tagRecType"];
    childTagList = json["childTagList"];
    childTagIdList = json["childTagIdList"];
    haveReward = json["haveReward"];
    ifNewest = json["ifNewest"];
    newestEndTime = json["newestEndTime"];
    communityIndex = json["communityIndex"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["actionUrl"] = actionUrl;
    map["adTrack"] = adTrack;
    map["desc"] = desc;
    map["bgPicture"] = bgPicture;
    map["headerImage"] = headerImage;
    map["tagRecType"] = tagRecType;
    map["childTagList"] = childTagList;
    map["childTagIdList"] = childTagIdList;
    map["haveReward"] = haveReward;
    map["ifNewest"] = ifNewest;
    map["newestEndTime"] = newestEndTime;
    map["communityIndex"] = communityIndex;
    return map;
  }

}

/// id : 222958
/// actionUrl : "eyepetizer://pgc/detail/1625/?title=%E5%B0%91%E5%B9%B4%E4%BC%81%E7%94%BBNEWS&userType=PGC&tabIndex=1"
/// labelList : null
/// icon : "http://img.kaiyanapp.com/c62a24c52588c6ba36c5c3ac3f4d2143.png?imageMogr2/quality/60/format/jpg"
/// iconType : "round"
/// time : 1605594397000
/// showHateVideo : false
/// followType : "author"
/// tagId : 0
/// tagName : null
/// issuerName : "少年企画NEWS"
/// topShow : false

class Header {
  int id;
  String actionUrl;
  dynamic labelList;
  String icon;
  String iconType;
  int time;
  bool showHateVideo;
  String followType;
  int tagId;
  dynamic tagName;
  String issuerName;
  bool topShow;

  Header({
      this.id, 
      this.actionUrl, 
      this.labelList, 
      this.icon, 
      this.iconType, 
      this.time, 
      this.showHateVideo, 
      this.followType, 
      this.tagId, 
      this.tagName, 
      this.issuerName, 
      this.topShow});

  Header.fromJson(dynamic json) {
    id = json["id"];
    actionUrl = json["actionUrl"];
    labelList = json["labelList"];
    icon = json["icon"];
    iconType = json["iconType"];
    time = json["time"];
    showHateVideo = json["showHateVideo"];
    followType = json["followType"];
    tagId = json["tagId"];
    tagName = json["tagName"];
    issuerName = json["issuerName"];
    topShow = json["topShow"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["actionUrl"] = actionUrl;
    map["labelList"] = labelList;
    map["icon"] = icon;
    map["iconType"] = iconType;
    map["time"] = time;
    map["showHateVideo"] = showHateVideo;
    map["followType"] = followType;
    map["tagId"] = tagId;
    map["tagName"] = tagName;
    map["issuerName"] = issuerName;
    map["topShow"] = topShow;
    return map;
  }

}

/// id : 303914155
/// nickname : "乔葵-in-wonderland"
/// avatar : "http://img.kaiyanapp.com/8ceff6380c3beb4f0aef2827e7113c51.jpeg?imageMogr2/quality/60/format/jpg"
/// ifPgc : false
/// ifLight : true
/// actionUrl : "eyepetizer://pgc/detail/303914155/?title=%E4%B9%94%E8%91%B5-in-wonderland&userType=NORMAL&tabIndex=0"
/// releaseDate : 1605574347000
/// expert : true

class UserList {
  int id;
  String nickname;
  String avatar;
  bool ifPgc;
  bool ifLight;
  String actionUrl;
  int releaseDate;
  bool expert;

  UserList({
      this.id, 
      this.nickname, 
      this.avatar, 
      this.ifPgc, 
      this.ifLight, 
      this.actionUrl, 
      this.releaseDate, 
      this.expert});

  UserList.fromJson(dynamic json) {
    id = json["id"];
    nickname = json["nickname"];
    avatar = json["avatar"];
    ifPgc = json["ifPgc"];
    ifLight = json["ifLight"];
    actionUrl = json["actionUrl"];
    releaseDate = json["releaseDate"];
    expert = json["expert"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["nickname"] = nickname;
    map["avatar"] = avatar;
    map["ifPgc"] = ifPgc;
    map["ifLight"] = ifLight;
    map["actionUrl"] = actionUrl;
    map["releaseDate"] = releaseDate;
    map["expert"] = expert;
    return map;
  }

}