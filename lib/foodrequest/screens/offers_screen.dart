import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/provider/main_provider.dart';
import 'package:sofra/screens/main_screen.dart';
import 'package:sofra/widgets/appbar.dart';
import 'package:sofra/widgets/navigationbar.dart';

class OffersScreen extends StatelessWidget {
  static const routename = '/Offers-screen';
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: MainAppbar().appbar(context),
      bottomNavigationBar: MainNavbar(
        ontab: (index) {
          mainData.changepage(index);

          Navigator.of(context)
              .popUntil(ModalRoute.withName(MainScreen.routename));
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
                        padding: const EdgeInsets.only(right: 20),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: <Widget>[
                            Text('احصل على خصم 10% لأول طلب لك'),
                            RaisedButton(
                              onPressed: () {},
                              color: Color(0xFFC2185B),
                              child: Text(
                                'احصل عليه الآن',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            )
                          ],
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
          )
        ],
      ),
    );
  }
}
