import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/cart_provider.dart';
import 'package:sofra/foodrequest/screens/cart_screen.dart';
import 'package:sofra/foodsell/provider/meal_sell_provider.dart';
import 'package:sofra/provider/main_provider.dart';
import 'package:sofra/screens/main_screen.dart';
import 'package:sofra/widgets/appbar.dart';
import 'package:sofra/widgets/navigationbar.dart';

class MealOrder extends StatefulWidget {
  static const routename = '/Mealorder-screen';

  @override
  _MealOrderState createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {
  int mealQuntity = 1;

  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealData =
        Provider.of<MealSellProvider>(context, listen: false).findByid(mealId);
    final cartData = Provider.of<Cart>(context, listen: false);

    return Scaffold(
        appBar: MainAppbar().appbar(context),
        bottomNavigationBar: MainNavbar(
          ontab: (index) {
            mainData.changepage(index);

            Navigator.of(context)
                .popUntil(ModalRoute.withName(MainScreen.routename));
          },
        ),
        body: LayoutBuilder(
          builder: (ctx, constrains) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                  minWidth: constrains.maxWidth),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 0.6,
                                offset: Offset(0.0, 1.0))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage('${mealData.imageUrl}'),
                              fit: BoxFit.cover)),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Wrap(
                            direction: Axis.vertical,
                            children: <Widget>[
                              Text(
                                mealData.name,
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                mealData.describtion,
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'السعر: ${mealData.price}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        'مدة تجهيز الطلب : ${mealData.time_of_order} دقيقة',
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Container(width: double.infinity, child: Text('طلب خاص')),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'ادخل طلبك هنا'),
                        maxLines: 3,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Text('الكمية'),
                          Wrap(
                            children: <Widget>[
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    mealQuntity++;
                                  });
                                },
                                child: Icon(Icons.add),
                                fillColor: Colors.white,
                                shape: CircleBorder(),
                              ),
                              Card(
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 92,
                                    height: 40,
                                    child: Text(
                                      '${mealQuntity}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  if (mealQuntity > 1) {
                                    setState(() {
                                      mealQuntity--;
                                    });
                                  }
                                },
                                child: Icon(Icons.remove),
                                fillColor: Colors.white,
                                shape: CircleBorder(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        cartData.addItem(
                            mealData.id,
                            mealData.price,
                            mealData.name,
                            mealQuntity,
                            mealData.imageUrl,
                            mealData.creatorId);
                        Navigator.of(context).pushNamed(CartScreen.routename);
                      },
                      color: Colors.pink,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart,
                            size: 30, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
