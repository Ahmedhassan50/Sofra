import 'package:flutter/foundation.dart';
import '../model/resturant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Restaurant_Provider with ChangeNotifier {
  List<Resturant> _resturant = [];
  String authToken;
  String userId;
  Restaurant_Provider({this.authToken, this.userId});

  List<Resturant> get resturant => _resturant;

  Future<void> addresturant(Resturant resData) async {
    final regestUrl =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB-OrewouCjMMH76PPdNZOiSN7UK36Kf5o';

    try {
      final regresponse = await http.post(regestUrl,
          body: json.encode({
            'email': resData.email,
            'password': resData.password,
            'returnSecureToken': true,
          }));
      final regresponseData = json.decode(regresponse.body);
      authToken = regresponseData['idToken'];
      userId = regresponseData['localId'];
      final url =
          'https://sofra-29cb3.firebaseio.com/resturants.json?auth=$authToken';
      final response = await http.post(url,
          body: json.encode({
            'id': userId,
            'name': resData.name,
            'email': resData.email,
            'mobile': resData.mobile,
            'password': resData.password,
            'categories': resData.categories,
            'minimum_charge': resData.minimum_charge,
            'delivery': resData.delivery,
            'delivarymobile': resData.deliveryData.mobile,
            'delivarywhatsUp': resData.deliveryData.whatsUp,
          }));
      // print(json.decode(response.body)['name']);
      final newRes = Resturant(
        id: userId,
        name: resData.name,
        email: resData.email,
        mobile: resData.mobile,
        password: resData.password,
        categories: resData.categories,
        minimum_charge: resData.minimum_charge,
        delivery: resData.delivery,
        deliveryData: DeliveryData(
            mobile: resData.deliveryData.mobile,
            whatsUp: resData.deliveryData.whatsUp),
      );

      _resturant.add(newRes);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchAndSetResturant() async {
    final url = 'https://sofra-29cb3.firebaseio.com/resturants.json';
    try {
      final response = await http.get(url);
      final loadData = json.decode(response.body) as Map<String, dynamic>;
      final List<Resturant> resData = [];
      //print(response.body);
      loadData.forEach((id, value) {
        resData.add(Resturant(
            id: value['id'],
            name: value['name'],
            email: value['email'],
            mobile: value['mobile'],
            password: value['password'],
            categories: value['categories'],
            minimum_charge: value['minimum_charge'],
            delivery: value['delivery'],
            deliveryData: DeliveryData(
                mobile: value['delivarymobile'],
                whatsUp: value['delivarywhatsUp'])));
      });
      _resturant = resData;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
