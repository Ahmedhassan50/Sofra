import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/provider/main_sell_provider.dart';

class MainSellScreen extends StatelessWidget {
  static const routename = '/Main-sell';
  @override
  Widget build(BuildContext context) {
    final mainSell=Provider.of<MainSell>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.pink,
              size: 30,
            ),
            onPressed: () {
              
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.today,
                color: Colors.pink,
                size: 30,
              ),
              onPressed: () {
                
              })
        ],
        elevation: 0,
      ),
      body:mainSell.getpage[mainSell.index] ,
       bottomNavigationBar: BottomNavigationBar(
          onTap: mainSell.changepage,
          backgroundColor: Color(0xFFC2185B),
          currentIndex: mainSell.index,
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