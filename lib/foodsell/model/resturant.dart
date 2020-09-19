import 'package:flutter/foundation.dart';
import '../model/meal.dart';

class DeliveryData {
  final String mobile;
  final String whatsUp;
  DeliveryData({@required this.mobile, @required this.whatsUp});
}

class Resturant {
  final String id;
  final String name;
  final String email;
  final String mobile;
  final String password;
  final String categories;
  final double minimum_charge;
  final double delivery;
  final DeliveryData deliveryData;
  final Meal meals;
  Resturant({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.mobile,
    @required this.password,
    @required this.categories,
    @required this.minimum_charge,
    @required this.delivery,
    @required this.deliveryData,
    this.meals,
  });
}
