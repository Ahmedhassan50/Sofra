import 'package:flutter/material.dart';
import '../screens/order_details_screen.dart';

class SignupScreen extends StatelessWidget {
  static const routename = '/Signup-screen';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/homebackground.jpg'),
                    fit: BoxFit.cover)),
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: size.height < size.width ? null : size.height,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  _loginInput(
                    Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    'الاسم',
                    TextInputType.emailAddress,
                  ),
                  _loginInput(
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    'البريد الالكتروني',
                    TextInputType.emailAddress,
                  ),
                  _loginInput(
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    'الجوال',
                    TextInputType.emailAddress,
                  ),
                  _loginInput(
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      'كلمة المرور',
                      TextInputType.number,
                      password: true),
                  _loginInput(
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      'اعادة كلمة المرور',
                      TextInputType.number,
                      password: true),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(OrderDetails.routename);
                      },
                      color: Color(0xFFC2185B),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: Text(
                          'تسجبل',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _loginInput(Icon icon, String text, TextInputType type,
      {bool password = false}) {
    return TextField(
      style: TextStyle(color: Colors.white),
      obscureText: password,
      keyboardType: type,
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          prefixIcon: icon,
          hintText: text,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
