import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/auth_user.dart';
import 'package:sofra/resources/exceptions.dart';
import '../screens/order_details_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routename = '/Signup-screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Map<String, String> _authData = {
    'name': '',
    'email': '',
    'mobile': '',
    'password': '',
  };
  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(
                'هناك خطا ما !',
                style: TextStyle(color: Colors.red),
              ),
              content: Text(message),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('تم'))
              ],
            ));
  }

  void _submit() async {
    final _isvaled = _formKey.currentState.validate();
    if (!_isvaled) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    _formKey.currentState.save();
    final userData = User(
      name: _authData['name'],
      email: _authData['email'],
      mobile: _authData['mobile'],
      password: _authData['password'],
    );
    try {
      await Provider.of<AuthUser>(context, listen: false).signUpUser(userData);
    } on ExccptionError catch (error) {
      _showErrorDialog('هناك خطأ ما من فضلك حاوب لاحقاَ');
    } catch (e) {
      _showErrorDialog('هناك خطأ ما من فضلك حاوب لاحقاَ');
    }

    setState(() {
      _isLoading = false;
    });
    final authData = Provider.of<AuthUser>(context, listen: false);
    if (authData.isAuth) {
      Navigator.of(context).pushReplacementNamed(OrderDetails.routename);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: ModalProgressHUD(
        inAsyncCall: _isLoading,
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
                child: Form(
                  key: _formKey,
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
                          TextInputType.emailAddress, onsave: (value) {
                        _authData['name'] = value.toString();
                      }),
                      _loginInput(
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          'البريد الالكتروني',
                          TextInputType.emailAddress, onsave: (value) {
                        _authData['email'] = value.toString();
                      }),
                      _loginInput(
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          'الجوال',
                          TextInputType.emailAddress, onsave: (value) {
                        _authData['mobile'] = value.toString();
                      }),
                      _loginInput(
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          'كلمة المرور',
                          TextInputType.number,
                          password: true, onsave: (value) {
                        _authData['password'] = value.toString();
                      }),
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
                            setState(() {
                              _isLoading = true;
                            });
                            _submit();
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
            ),
          ],
        ),
      )),
    );
  }

  Widget _loginInput(Icon icon, String text, TextInputType type,
      {bool password = false, Function onsave}) {
    return TextFormField(
      onSaved: onsave,
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
