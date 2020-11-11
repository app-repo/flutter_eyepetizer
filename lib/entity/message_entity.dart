
class MessageEntity {
  List<Message> messageList;
  String nextPageUrl;
  int updateTime;

  MessageEntity({this.messageList, this.nextPageUrl, this.updateTime});

  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      messageList: json['messageList'] != null
          ? (json['messageList'] as List)
              .map((i) => Message.fromJson(i))
              .toList()
          : null,
      nextPageUrl: json['nextPageUrl'],
      updateTime: json['updateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextPageUrl'] = this.nextPageUrl;
    data['updateTime'] = this.updateTime;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Message {
  String actionUrl;
  String content;
  int date;
  String icon;
  int id;
  bool ifPush;
  int pushStatus;
  String title;
  bool viewed;

  Message(
      {this.actionUrl, this.content, this.date, this.icon, this.id, this.ifPush, this.pushStatus,
        this.title, this.viewed});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      actionUrl: json['actionUrl'],
      content: json['content'],
      date: json['date'],
      icon: json['icon'],
      id: json['id'],
      ifPush: json['ifPush'],
      pushStatus: json['pushStatus'],
      title: json['title'],
      viewed: json['viewed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actionUrl'] = this.actionUrl;
    data['content'] = this.content;
    data['date'] = this.date;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['ifPush'] = this.ifPush;
    data['pushStatus'] = this.pushStatus;
    data['title'] = this.title;
    data['viewed'] = this.viewed;
    return data;
  }
}