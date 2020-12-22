import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodsell/provider/auth_sell.dart';

class ProfileSell extends StatelessWidget {
  static const routename = '/Profile-sell';
  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthSell>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constrais) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: constrais.maxHeight + 500),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Colors.grey[300],
                        backgroundImage:
                            AssetImage('assets/images/homebackground2.jpg'),
                      ),
                      _infocards(
                          Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                          '${_authData.resData.name}'),
                      _infocards(
                          Icon(
                            Icons.mail_outline,
                            color: Colors.black,
                          ),
                          '${_authData.resData.email}'),
                      _infocards(
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          '${_authData.resData.mobile}'),
                      _infocards(
                          Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          'القاهرة',
                          icon2: Icon(Icons.arrow_downward)),
                      _infocards(
                          Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          'حي شبرا',
                          icon2: Icon(Icons.arrow_downward)),
                      _infocards(
                          Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                          '${_authData.resData.categories}',
                          icon2: Icon(Icons.arrow_downward)),
                      _infocards(
                        Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        '${_authData.resData.minimum_charge} جنية',
                      ),
                      _infocards(
                        Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        '${_authData.resData.delivery} جنية',
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Text('الحالة'),
                            Switch(value: true, onChanged: (_) {})
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'بيانات التواصل',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      _infocards(
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          '${_authData.resData.deliveryData.mobile}'),
                      _infocards(
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          '${_authData.resData.deliveryData.whatsUp}'),
                      RaisedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text('تعديل'),
                        ),
                        color: Colors.pink,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infocards(Icon icon, String content, {Icon icon2}) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.grey[300],
        child: ListTile(
          leading: icon,
          title: Text(content),
          trailing: icon2,
        ),
      ),
    );
  }
}
