import 'package:flutter/material.dart';
import '../foodrequest/screens/notification_screen.dart';
import '../foodrequest/screens/cart_screen.dart';

class MainAppbar {


Widget appbar(BuildContext context){
  return AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.pink,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, NotificationsScreen.routename);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.pink,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routename);
              })
        ],
        elevation: 0,
      );
}

  /*@override
  Widget build(BuildContext context) {
    return 
  }*/
}