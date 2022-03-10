import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification_reader/NotificationData.dart';
export './NotificationData.dart';

class NotificationReader {
  static const MethodChannel _channel = MethodChannel('notification_reader');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future get openNotificationReaderSettings async {
    await _channel.invokeMethod('openNotificationReaderSettings');
  }

  static Future<NotificationData> onNotificationRecieve() async {
    var data = await _channel.invokeMethod('onNotificationRecieve');
    var res = jsonDecode(data);
    if (data != null) {
      NotificationData notifData = NotificationData(
        title: res['android.title'],
        body: res['android.text'],
        packageName: res['packageName'],
        data: res,
      );
      return notifData;
    } else {
      return NotificationData();
    }
  }

  static Future get getJsonData async {
    var data = await _channel.invokeMethod('onNotificationRecieve');
    return data;
  }
}
