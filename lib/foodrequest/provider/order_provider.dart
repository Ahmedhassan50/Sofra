import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sofra/resources/exceptions.dart';

class OrderProvider with ChangeNotifier {
  final String token;
  final String userId;
  OrderProvider({this.token, this.userId});
  List<Map<String, dynamic>> orderItems = [];

  Future<void> addOrder(Map<String, dynamic> orderItems) async {
    final url =
        'https://sofra-29cb3.firebaseio.com/orders/$userId.json?auth=$token';
    // final notfiyUrl = 'https://onesignal.com/api/v1/notifications';

    try {
      final response = await http.post(url,
          body: json.encode({
            'clientName': orderItems['clientName'],
            'totalprice': orderItems['totalprice'],
          }));
      // print(json.decode(response.body));
      /* final responseNtify = await http.post(notfiyUrl,
          body: json.encode({
            "app_id": "afc98898-f653-479b-b7af-7e00584cd63b",
            "include_player_ids": ["975173dd-7811-47c6-9727-607921764d3d"],
            "data": {"foo": "bar"},
            "contents": {"en": "English Message"}
          }),
          headers: {
            "Content-type": "application/json",
            "Authorization":
                "Basic NTEzNzMzOTUtMWQ1OC00Y2QzLTg2MmMtMTBkMzhkMjc0NjJj",
          });
      print(json.decode(responseNtify.body));*/
    } catch (e) {
      throw ExccptionError(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> fechOrders() async {
    final url =
        'https://sofra-29cb3.firebaseio.com/orders/$userId.json?auth=$token';
    try {
      final response = await http.get(url);

      final loadedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Map<String, dynamic>> data = [];
      loadedData.forEach((key, value) {
        data.add({
          'clientName': value['clientName'],
          'totalprice': value['totalprice'],
        });
      });

      return data;
    } catch (e) {
      throw ExccptionError(e.toString());
    }
  }
}
