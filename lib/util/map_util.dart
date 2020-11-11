class MapUtil {
  static Map<String, String> urlToMap(String url) {
    var paramsMap = Map<String, String>();
    var index = url.indexOf("?");
    String s = url.substring(index + 1);
    print(s.toString());
    var params = s.split("&");
    print(params.toString());
    params.forEach((e) {
      paramsMap[e.split("=")[0]] = e.split("=")[1];
    });
    return paramsMap;
  }
}
