import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/cart_provider.dart';
import 'package:sofra/provider/main_provider.dart';
import 'package:sofra/screens/main_screen.dart';
import 'package:sofra/widgets/appbar.dart';
import 'package:sofra/widgets/navigationbar.dart';
import '../widgets/cart_list.dart';
import '../screens/login_screen.dart';



class CartScreen extends StatelessWidget {
  static const routename='/cart-screen';
  @override
  Widget build(BuildContext context) {
    final mainData=Provider.of<MainProvider>(context,listen: false);
     final cartData=Provider.of<Cart>(context);
    return Scaffold(
      appBar: MainAppbar().appbar(context) ,
      bottomNavigationBar: MainNavbar(ontab: (index){
        mainData.changepage(index);
      
        Navigator.of(context).popUntil( ModalRoute.withName(MainScreen.routename));
      },),





      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            CartList(),
            Text('المجموع الكلي'),
            Card(
              elevation: 5,
              shape: CircleBorder(),
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 80,
                child: Text('${cartData.totalPrice} جنية')),
            ),

            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              RaisedButton(onPressed: (){
         Navigator.of(context).pushNamed(LoginScreen.routename);
              },
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Text('تاكيد الطلب',style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              ),
              RaisedButton(onPressed: (){},
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Text('إضافة المزيد .',style: TextStyle(
                  color: Colors.white,
                ),),
              ),
              ),
            ],)
          ],
        ),
      ),
      
    );
  }
}