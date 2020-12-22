import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/cart_provider.dart';
import 'package:sofra/foodrequest/provider/notification_provider.dart';
import 'package:sofra/widgets/badge.dart';
import '../foodrequest/screens/notification_screen.dart';
import '../foodrequest/screens/cart_screen.dart';

class MainAppbar {
  Widget appbar(BuildContext context) {
    final notifiValue = Provider.of<NotificationProvider>(context);
    final cartLength = Provider.of<Cart>(context, listen: false).items.length;

    return AppBar(
      leading: Badge(
          child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.pink,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, NotificationsScreen.routename);
                notifiValue.clearAlarm();
              }),
          value: notifiValue.notifiNumbers == 0
              ? '0'
              : notifiValue.notifiNumbers.toString()),
      actions: <Widget>[
        Badge(
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.pink,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routename);
                }),
            value: cartLength == 0 ? '0' : cartLength.toString())
      ],
      elevation: 0,
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return 
  }*/
}
