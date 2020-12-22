import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/auth_user.dart';

class ProfileScreen extends StatelessWidget {
  static const routename = '/Profile-screen';
  @override
  Widget build(BuildContext context) {
    final _authData = Provider.of<AuthUser>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: _authData.isAuth
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  _infocards(
                      Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      '${_authData.userData.name}'),
                  _infocards(
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      '${_authData.userData.email}'),
                  _infocards(
                      Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      '${_authData.userData.mobile}'),
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
              )
            : Center(
                child: Text('الرجاء تسجيل الدخول'),
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
