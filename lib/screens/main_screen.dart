import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/auth_user.dart';
import 'package:sofra/widgets/appbar.dart';
import '../foodrequest/screens/notification_screen.dart';
import '../foodrequest/screens/cart_screen.dart';
import '../provider/main_provider.dart';

class MainScreen extends StatefulWidget {
  static const routename = '/Main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    final mainData = Provider.of<MainProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppbar().appbar(context),
      body: mainData.getpage[mainData.index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: mainData.changepage,
          backgroundColor: Color(0xFFC2185B),
          currentIndex: mainData.index,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          elevation: 5,
          items: [
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Icon(
                  Icons.assignment,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                title: SizedBox.shrink(),
                icon: Icon(
                  Icons.linear_scale,
                  color: Colors.white,
                )),
          ]),
    );
  }
}
