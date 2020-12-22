import 'package:flutter/foundation.dart';
import 'package:sofra/foodsell/model/resturant.dart';
import 'package:sofra/resources/exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthSell with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;
  Resturant resData;

  bool get isAuth {
    return _token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signIn(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB-OrewouCjMMH76PPdNZOiSN7UK36Kf5o';
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw ExccptionError(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));

      final rURL =
          'https://sofra-29cb3.firebaseio.com/resturants.json?auth=$_token&orderBy="id"&equalTo="$_userId"';
      final resInfo = await http.get(rURL);
      final resSnap = json.decode(resInfo.body) as Map<String, dynamic>;
      //print(resSnap['${resSnap.keys.first}']['name']);
      resData = Resturant(
          id: resSnap['${resSnap.keys.first}']['id'],
          name: resSnap['${resSnap.keys.first}']['name'],
          email: resSnap['${resSnap.keys.first}']['email'],
          mobile: resSnap['${resSnap.keys.first}']['mobile'],
          password: resSnap['${resSnap.keys.first}']['password'],
          categories: resSnap['${resSnap.keys.first}']['categories'],
          minimum_charge: resSnap['${resSnap.keys.first}']['minimum_charge'],
          delivery: resSnap['${resSnap.keys.first}']['delivery'],
          deliveryData: DeliveryData(
            mobile: resSnap['${resSnap.keys.first}']['delivarymobile'],
            whatsUp: resSnap['${resSnap.keys.first}']['delivarywhatsUp'],
          ));

      notifyListeners();
    } catch (e) {
      throw ExccptionError(e.toString());
    }
  }

  void logOut() {
    _token = null;
    _userId = null;
    notifyListeners();
  }
}
