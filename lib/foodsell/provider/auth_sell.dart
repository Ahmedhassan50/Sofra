import 'package:flutter/foundation.dart';
import 'package:sofra/resources/exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthSell with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;

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
      notifyListeners();
    } catch (e) {
      throw ExccptionError(e.toString());
    }
  }
}
