import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodsell/provider/meal_sell_provider.dart';
import '../screens/add_meal.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../screens/update_meal.dart';

class HomeSell extends StatelessWidget {
  static const routename = '/Home-sell';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<MealSellProvider>(context, listen: false)
            .fetchAndSetMeals(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<MealSellProvider>(
                child: Center(
                  child: Text(
                    'تاكد من الاتصال بالانترنت',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                builder: (ctx, mealData, child) => snapshot.connectionState ==
                        ConnectionState.none
                    ? child
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              child: Text(
                                'مطعم الصحاب',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.pink),
                              )),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 10),
                              itemCount: mealData.maels.length,
                              itemBuilder: (ctx, i) => Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                key: ValueKey(i),
                                actions: <Widget>[
                                  IconSlideAction(
                                    icon: Icons.delete,
                                    foregroundColor: Colors.red,
                                    onTap: () {
                                      _showdialog(context, mealData,
                                          mealData.maels[i].id);
                                    },
                                  ),
                                  IconSlideAction(
                                    icon: Icons.border_color,
                                    foregroundColor: Colors.green,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          UpdateMeal.routename,
                                          arguments: mealData.maels[i].id);
                                    },
                                  ),
                                ],
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/images/homebackground2.jpg',
                                          ),
                                        ),
                                        title: Text(mealData.maels[i].name),
                                        subtitle:
                                            Text(mealData.maels[i].describtion),
                                        trailing: Wrap(
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text('السعر'),
                                            Text(mealData.maels[i].price
                                                .toString())
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(AddMeal.routname);
        },
        child: Icon(
          Icons.add,
          color: Colors.pink,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showdialog(BuildContext ctx, MealSellProvider mealData, String id) {
    showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
              title: Text('تحذير'),
              content: Text('هل انت متاكد من الحذف ؟'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      mealData.deletMeal(id);
                      Navigator.of(ctx).pop();
                    },
                    child: Text('نعم')),
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('لا')),
              ],
            ));
  }
}
