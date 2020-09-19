import 'dart:io';
import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final String name;
  final String describtion;
  final double price;
  final double price_in_offer;
  final int time_of_order;
  final String imageUrl;

  Meal({
    @required this.id,
    @required this.name,
    @required this.describtion,
    @required this.price,
    this.price_in_offer,
    this.time_of_order,
    @required this.imageUrl,
  });
}
