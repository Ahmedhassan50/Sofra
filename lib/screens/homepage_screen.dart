import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodsell/provider/auth_sell.dart';

import 'package:sofra/foodsell/screens/login_screen.dart';
import 'package:sofra/resources/assets_constant.dart';
import 'package:sofra/screens/main_screen.dart';
import 'package:sofra/screens/main_sell.dart';

class HomeScreen extends StatelessWidget {
  static const routename = '/';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final authData = Provider.of<AuthSell>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/homebackground2.jpg'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'سفرة',
                style: TextStyle(fontSize: 80, color: Colors.pink),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _homebutton('طلب طعام', () {
                        Navigator.pushNamed(context, MainScreen.routename);
                      }),
                      _homebutton('بيع طعام', () {
                        authData.isAuth
                            ? Navigator.pushNamed(
                                context, MainSellScreen.routename)
                            : Navigator.pushNamed(context, LoginSell.routename);
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _homebutton(String title, Function ontab) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: ontab,
        color: Colors.pink,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
