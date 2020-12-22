import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:sofra/foodsell/model/meal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealSellProvider with ChangeNotifier {
  String authToken;
  String userId;
  MealSellProvider({this.authToken, this.userId});

  List<Meal> _meal = [];

  List<Meal> get maels => _meal;

  String fileName;
  File image;
  String imageFileUrl;

  Future<void> _uploadImage() async {
    FirebaseStorage flirebaseStorage =
        FirebaseStorage(storageBucket: 'gs://sofra-29cb3.appspot.com');
    StorageReference firebaseStrorgeRef =
        flirebaseStorage.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStrorgeRef.putFile(image);
    await uploadTask.onComplete;
    imageFileUrl = await firebaseStrorgeRef.getDownloadURL();
    image = null;
    notifyListeners();
  }

  Future<void> fetchAndSetMeals(String resId,
      [bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$resId"' : '';
    final url = 'https://sofra-29cb3.firebaseio.com/meals.json?$filterString';
    try {
      final response = await http.get(url);
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      final List<Meal> loadedMeals = [];
      if (extractData == null) {
        return;
      }
      extractData.forEach((mealId, mealData) {
        loadedMeals.add(
          Meal(
              id: mealId,
              name: mealData['name'],
              describtion: mealData['describtion'],
              price: mealData['price'],
              price_in_offer: mealData['price_in_offer'],
              time_of_order: mealData['time_of_order'],
              imageUrl: mealData['imageUrl'],
              creatorId: mealData['creatorId']),
        );
      });
      _meal = loadedMeals;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addMeal(Meal meal) async {
    // String id;

    //final idUrl ='https://sofra-29cb3.firebaseio.com/resturants/$userId.json?auth=$authToken';

    try {
      // final idData = await http.get(idUrl);
      //final loadeData = json.decode(idData.body) as Map<String, dynamic>;
      //id = (loadeData.keys.first).toString();
      final url =
          'https://sofra-29cb3.firebaseio.com/meals.json?auth=$authToken';

      await _uploadImage();
      final response = await http.post(url,
          body: json.encode({
            'name': meal.name,
            'describtion': meal.describtion,
            'price': meal.price,
            'price_in_offer': meal.price_in_offer,
            'time_of_order': meal.time_of_order,
            'imageUrl': imageFileUrl,
            'creatorId': userId
          }));

      final newMeal = Meal(
          id: json.decode(response.body)['name'],
          name: meal.name,
          describtion: meal.describtion,
          price: meal.price,
          price_in_offer: meal.price_in_offer,
          time_of_order: meal.time_of_order,
          imageUrl: imageFileUrl,
          creatorId: userId);

      _meal.add(newMeal);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Meal findByid(String id) {
    return _meal.firstWhere((meal) => meal.id == id);
  }

  Future<void> updateMeal(String id, Meal newMeal) async {
    final mealIndex = _meal.indexWhere((meal) => meal.id == id);
    final url = 'https://sofra-29cb3.firebaseio.com/meals/$id.json';
    if (mealIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            'name': newMeal.name,
            'describtion': newMeal.describtion,
            'price': newMeal.price,
            'price_in_offer': newMeal.price_in_offer,
            'time_of_order': newMeal.time_of_order,
          }));
      _meal[mealIndex] = newMeal;
      notifyListeners();
    }
  }

  Future<void> deletMeal(String id) async {
    final url = 'https://sofra-29cb3.firebaseio.com/meals/$id.json';
    final mealIndex = _meal.indexWhere((meal) => meal.id == id);
    var existMeal = _meal[mealIndex];
    _meal.removeAt(mealIndex);
    notifyListeners();

    final respond = await http.delete(url);
    try {
      // FirebaseStorage.instance.ref().child(fileName).delete();
    } catch (e) {
      print(e);
    }

    if (respond.statusCode >= 400) {
      _meal.insert(mealIndex, existMeal);
      notifyListeners();
    }
    existMeal = null;
  }
}
