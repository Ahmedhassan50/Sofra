import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sofra/resources/exceptions.dart';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String name;
  final String email;
  final String mobile;
  final String password;
  User({
    @required this.name,
    @required this.email,
    @required this.mobile,
    @required this.password,
    this.id,
  });
}

class AuthUser with ChangeNotifier {
  String _token;
  String _userId;
  User _userData;

  bool get isAuth {
    return _token != null;
  }

  User get userData => _userData;
  String get userId {
    return _userId;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signUpUser(User userData) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB-OrewouCjMMH76PPdNZOiSN7UK36Kf5o';

    try {
      final response = await http.post(url,
          body: json.encode({
            'email': userData.email,
            'password': userData.password,
            'returnSecureToken': true,
          }));
      final regresponseData = json.decode(response.body);
      if (regresponseData['error'] != null) {
        throw ExccptionError(regresponseData['error']['message']);
      }
      _token = regresponseData['idToken'];
      _userId = regresponseData['localId'];
      final userUrl =
          'https://sofra-29cb3.firebaseio.com/users.json?auth=$_token';
      final _deviceId = await OneSignal.shared.getPermissionSubscriptionState();
      final responseUser = await http.post(userUrl,
          body: json.encode({
            'id': _userId,
            'name': userData.name,
            'email': userData.email,
            'mobile': userData.mobile,
            'password': userData.password,
            'deviceid': _deviceId.subscriptionStatus.userId
          }));

      _userData = User(
          id: _userId,
          name: userData.name,
          email: userData.email,
          mobile: userData.mobile,
          password: userData.password);

      notifyListeners();
    } catch (error) {
      throw ExccptionError(error.toString());
    }
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

      final rURL = 'https://sofra-29cb3.firebaseio.com/users.json?auth=$_token';
      final resInfo = await http.get(rURL);
      final resSnap = json.decode(resInfo.body) as Map<String, dynamic>;
      //print(resSnap['${resSnap.keys.first}']['name']);
      _userData = User(
        id: resSnap['${resSnap.keys.first}']['id'],
        name: resSnap['${resSnap.keys.first}']['name'],
        email: resSnap['${resSnap.keys.first}']['email'],
        mobile: resSnap['${resSnap.keys.first}']['mobile'],
        password: resSnap['${resSnap.keys.first}']['password'],
      );

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
