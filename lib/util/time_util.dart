import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class TimeUtil {
  static String getFriendlyTimeSpanByNow(int millis) {
    int now = DateTime.now().millisecondsSinceEpoch;
    int span = now - millis;
    if (span < 1000) {
      return "刚刚";
    } else if (span < 60000) {
      return "${(span / 1000).toStringAsFixed(0)}秒前";
    } else if (span < 3600000) {
      return "${(span / 60000).toStringAsFixed(0)}分钟前";
    } else if (DateUtil.isToday(millis)) {
      return "今天";
    } else if (DateUtil.isYesterdayByMs(millis, now)) {
      return "昨天";
    }
    return DateUtil.formatDateMs(millis, format: "yyyy-MM-dd");
  }
}
