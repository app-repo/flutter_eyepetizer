/// startPageAd : {"displayTimeDuration":3,"showBottomBar":false,"countdown":true,"actionUrl":"eyepetizer://miniProgram?title=gh_de4264dc10c3&url=pages%2Flive-room%2Flive-room%3Froom_id%3D7969239330543645851","blurredImageUrl":"http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg","canSkip":true,"version":"568","adaptiveUrls":"{\"1.778\":\"http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg\",\"2.056\":\"http://img.kaiyanapp.com/c97fc38b27f2762f158e44a983a03d3d.jpeg?imageMogr2/quality/60/format/jpg\",\"2.165\":\"http://img.kaiyanapp.com/87453b3799f73cd3fe07b0421ad8fdcb.jpeg?imageMogr2/quality/60/format/jpg\"}","buttonPosition":0,"imageUrl":"http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg","displayCount":1,"startTime":1605358800000,"endTime":1605363960000,"id":290,"adTrack":[],"newImageUrl":"http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg"}

class ConfigEntity {
  StartPageAd startPageAd;

  ConfigEntity({
      this.startPageAd});

  ConfigEntity.fromJson(dynamic json) {
    startPageAd = json["startPageAd"] != null ? StartPageAd.fromJson(json["startPageAd"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (startPageAd != null) {
      map["startPageAd"] = startPageAd.toJson();
    }
    return map;
  }

}

/// displayTimeDuration : 3
/// showBottomBar : false
/// countdown : true
/// actionUrl : "eyepetizer://miniProgram?title=gh_de4264dc10c3&url=pages%2Flive-room%2Flive-room%3Froom_id%3D7969239330543645851"
/// blurredImageUrl : "http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg"
/// canSkip : true
/// version : "568"
/// adaptiveUrls : "{\"1.778\":\"http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg\",\"2.056\":\"http://img.kaiyanapp.com/c97fc38b27f2762f158e44a983a03d3d.jpeg?imageMogr2/quality/60/format/jpg\",\"2.165\":\"http://img.kaiyanapp.com/87453b3799f73cd3fe07b0421ad8fdcb.jpeg?imageMogr2/quality/60/format/jpg\"}"
/// buttonPosition : 0
/// imageUrl : "http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg"
/// displayCount : 1
/// startTime : 1605358800000
/// endTime : 1605363960000
/// id : 290
/// adTrack : []
/// newImageUrl : "http://img.kaiyanapp.com/b41ad134399b93735219184ef3f1c3aa.jpeg?imageMogr2/quality/60/format/jpg"

class StartPageAd {
  int displayTimeDuration;
  bool showBottomBar;
  bool countdown;
  String actionUrl;
  String blurredImageUrl;
  bool canSkip;
  String version;
  String adaptiveUrls;
  int buttonPosition;
  String imageUrl;
  int displayCount;
  int startTime;
  int endTime;
  int id;
  List<dynamic> adTrack;
  String newImageUrl;

  StartPageAd({
      this.displayTimeDuration, 
      this.showBottomBar, 
      this.countdown, 
      this.actionUrl, 
      this.blurredImageUrl, 
      this.canSkip, 
      this.version, 
      this.adaptiveUrls, 
      this.buttonPosition, 
      this.imageUrl, 
      this.displayCount, 
      this.startTime, 
      this.endTime, 
      this.id, 
      this.adTrack, 
      this.newImageUrl});

  StartPageAd.fromJson(dynamic json) {
    displayTimeDuration = json["displayTimeDuration"];
    showBottomBar = json["showBottomBar"];
    countdown = json["countdown"];
    actionUrl = json["actionUrl"];
    blurredImageUrl = json["blurredImageUrl"];
    canSkip = json["canSkip"];
    version = json["version"];
    adaptiveUrls = json["adaptiveUrls"];
    buttonPosition = json["buttonPosition"];
    imageUrl = json["imageUrl"];
    displayCount = json["displayCount"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    id = json["id"];

    newImageUrl = json["newImageUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["displayTimeDuration"] = displayTimeDuration;
    map["showBottomBar"] = showBottomBar;
    map["countdown"] = countdown;
    map["actionUrl"] = actionUrl;
    map["blurredImageUrl"] = blurredImageUrl;
    map["canSkip"] = canSkip;
    map["version"] = version;
    map["adaptiveUrls"] = adaptiveUrls;
    map["buttonPosition"] = buttonPosition;
    map["imageUrl"] = imageUrl;
    map["displayCount"] = displayCount;
    map["startTime"] = startTime;
    map["endTime"] = endTime;
    map["id"] = id;
    if (adTrack != null) {
      map["adTrack"] = adTrack.map((v) => v.toJson()).toList();
    }
    map["newImageUrl"] = newImageUrl;
    return map;
  }

}