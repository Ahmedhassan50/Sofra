import 'package:flutter/foundation.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationProvider with ChangeNotifier {
  List<Map<String, dynamic>> notifiView = [];
  int notifiNumbers = 0;

  NotificationProvider() {
    _initNotiifations();
  }

  void _initNotiifations() {
    OneSignal.shared.init('afc98898-f653-479b-b7af-7e00584cd63b');
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      notifiView.insert(0, {
        'title': notification.payload.title,
        'subtitle': notification.payload.body
      });
      notifiNumbers++;
      notifyListeners();
    });
  }

  void clearAlarm() {
    notifiNumbers = 0;
    notifyListeners();
  }

  Future<void> postNotification(
      String title, String content, List<String> resId) async {
    resId.forEach((element) async {
      final url =
          'https://sofra-29cb3.firebaseio.com/resturants.json?orderBy="id"&equalTo="$element"';
      final response = await http.get(url);
      final loadedData = json.decode(response.body) as Map<String, dynamic>;
      final String id = loadedData['${loadedData.keys.first}']['deviceid'];
      OneSignal.shared.postNotification(OSCreateNotification(
          playerIds: ['$id'], content: content, heading: title));
    });
  }
}
