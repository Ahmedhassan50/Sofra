import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodsell/screens/add_offer_sell.dart';
import 'package:sofra/foodsell/screens/update_offer.dart';
import 'package:sofra/provider/main_sell_provider.dart';
import 'package:sofra/screens/main_sell.dart';
import 'package:sofra/widgets/navigationbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OffersSell extends StatelessWidget {
  static const routename = '/Offers_sell';

  @override
  Widget build(BuildContext context) {
    final mainsell = Provider.of<MainSell>(context, listen: false);
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
                Icons.today,
                color: Colors.pink,
                size: 30,
              ),
              onPressed: () {})
        ],
        elevation: 0,
      ),
      bottomNavigationBar: MainNavbar(
        ontab: (index) {
          mainsell.changepage(index);

          Navigator.of(context)
              .popUntil(ModalRoute.withName(MainSellScreen.routename));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Text(
                'جديد العروض',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              itemCount: 10,
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  key: ValueKey(i),
                  actions: <Widget>[
                    IconSlideAction(
                      icon: Icons.delete,
                      foregroundColor: Colors.red,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      icon: Icons.border_color,
                      foregroundColor: Colors.green,
                      onTap: () {
                        Navigator.of(context).pushNamed(UpdateOffer.routename);
                      },
                    ),
                  ],
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 130,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 3.0)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 32),
                          child: Text('احصل على خصم 10% لأول طلب لك'),
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
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddOfferSell.routename);
              },
              color: Color(0xFFC2185B),
              child: Text(
                'اضف عرض جديد',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}
