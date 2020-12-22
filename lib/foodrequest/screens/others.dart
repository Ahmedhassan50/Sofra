import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/auth_user.dart';
import 'package:sofra/provider/main_provider.dart';
import 'package:sofra/screens/homepage_screen.dart';
import './offers_screen.dart';
import './contact_us.dart';

class Others extends StatefulWidget {
  static const routename = '/Others-screen';

  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthUser>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          _body(
              Icon(
                Icons.card_giftcard,
                color: Colors.black,
              ),
              'العروض', () {
            Navigator.of(context).pushNamed(OffersScreen.routename);
          }),
          Divider(
            thickness: 2,
          ),
          _body(
              Icon(
                Icons.email,
                color: Colors.black,
              ),
              'تواصل معنا', () {
            Navigator.of(context).pushNamed(ContactUs.routename);
          }),
          Divider(
            thickness: 2,
          ),
          _body(
              Icon(
                Icons.lightbulb_outline,
                color: Colors.black,
              ),
              'عن التطبيق',
              () {}),
          Divider(
            thickness: 2,
          ),
          _body(
              Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              'تسجيل الخروج', () {
            _showDialog(context, _authData);
          }),
        ],
      ),
    );
  }

  Widget _body(Icon icon, String title, Function onpress) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onpress,
    );
  }

  void _showDialog(BuildContext cotx, AuthUser auth) {
    showDialog(
        context: cotx,
        builder: (ctx) => AlertDialog(
              content: Wrap(
                spacing: 15,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(
                    'هل انت متاكد من الخروج؟',
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          auth.logOut();
                          Navigator.of(context).popUntil(
                              ModalRoute.withName(HomeScreen.routename));
                          Provider.of<MainProvider>(context, listen: false)
                              .index = 0;
                        },
                        color: Colors.white,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.check,
                          color: Colors.red,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(cotx).pop();
                        },
                        color: Colors.white,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              actions: <Widget>[],
            ));
  }
}
