class PrivateMessageEntity {
  List<Item> itemList;
  String nextPageUrl;
  int total;

  PrivateMessageEntity({this.itemList, this.nextPageUrl, this.total});

  factory PrivateMessageEntity.fromJson(Map<String, dynamic> json) {
    return PrivateMessageEntity(
      itemList: json['itemList'] != null
          ? (json['itemList'] as List).map((i) => Item.fromJson(i)).toList()
          : null,
      nextPageUrl: json['nextPageUrl'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.itemList != null) {
      data['itemList'] = this.itemList.map((v) => v.toJson()).toList();
    }
    if (this.nextPageUrl != null) {
      data['nextPageUrl'] = this.nextPageUrl;
    }
    return data;
  }
}

class Data {
  String actionUrl;
  String content;
  String dataType;
  int id;
  int lastTime;
  int unReadCount;
  User user;

  Data(
      {this.actionUrl,
      this.content,
      this.dataType,
      this.id,
      this.lastTime,
      this.unReadCount,
      this.user});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      actionUrl: json['actionUrl'],
      content: json['content'],
      dataType: json['dataType'],
      id: json['id'],
      lastTime: json['lastTime'],
      unReadCount: json['unReadCount'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actionUrl'] = this.actionUrl;
    data['content'] = this.content;
    data['dataType'] = this.dataType;
    data['id'] = this.id;
    data['lastTime'] = this.lastTime;
    data['unReadCount'] = this.unReadCount;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Item {
  Data data;
  int adIndex;
  int id;
  String type;
  Item({this.data, this.adIndex, this.id, this.type});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      adIndex: json['adIndex'],
      id: json['id'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adIndex'] = this.adIndex;
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class User {
  String actionUrl;
  String area;
  String avatar;
  String description;
  bool expert;
  bool followed;
  bool ifPgc;
  bool limitVideoOpen;
  String nickname;

  User({
    this.actionUrl,
    this.area,
    this.avatar,
    this.description,
    this.expert,
    this.followed,
    this.ifPgc,
    this.limitVideoOpen,
    this.nickname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      actionUrl: json['actionUrl'],
      area: json['area'],
      avatar: json['avatar'],
      expert: json['expert'],
      followed: json['followed'],
      limitVideoOpen: json['limitVideoOpen'],
      nickname: json['nickname'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['expert'] = this.expert;
    data['followed'] = this.followed;
    data['ifPgc'] = this.ifPgc;
    data['limitVideoOpen'] = this.limitVideoOpen;
    data['nickname'] = this.nickname;
    data['actionUrl'] = this.actionUrl;
    data['area'] = this.area;
    data['description'] = this.description;
    return data;
  }
}
