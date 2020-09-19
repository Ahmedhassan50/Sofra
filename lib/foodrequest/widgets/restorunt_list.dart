import 'package:flutter/material.dart';
import 'package:sofra/foodsell/provider/resturant_provider.dart';
import 'package:sofra/provider/main_provider.dart';
import '../screens/restorunt_details_screen.dart';
import 'package:provider/provider.dart';

class RestouruntList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    final resData = Provider.of<Restaurant_Provider>(context);
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        itemCount: resData.resturant.length,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RestoruntDetails.routename);
                },
                child: Container(
                  width: size.width * 0.8,
                  height: 130,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 3.0)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${resData.resturant[i].name}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.star_border,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              'الحد الادنى للطلب ${resData.resturant[i].minimum_charge} جنية',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'رسوم التوصيل ${resData.resturant[i].delivery} جنية',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'مفتوح',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage:
                      AssetImage('assets/images/homebackground2.jpg'),
                  maxRadius: 50,
                ),
                right: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
