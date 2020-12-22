import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/notification_provider.dart';
import '../screens/cart_screen.dart';

class NotificationsScreen extends StatelessWidget {
  static const routename = '/Notifications-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.pink,
              size: 30,
            ),
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.pink,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, CartScreen.routename);
              })
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[400],
      body: Consumer<NotificationProvider>(
        builder: (context, notifiData, ch) => Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: notifiData.notifiView.length,
                  itemBuilder: (ctx, i) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                            leading: Icon(Icons.notifications_active),
                            title: Text(
                              '${notifiData.notifiView[i]['title']}',
                              style: TextStyle(fontSize: 12),
                            ),
                            subtitle: Text(
                              '${notifiData.notifiView[i]['subtitle']}',
                              style: TextStyle(fontSize: 10),
                            ),
                            trailing: Wrap(
                              children: <Widget>[
                                Icon(
                                  Icons.access_time,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  'منذ دقيقة',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                              spacing: 8,
                            )),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
