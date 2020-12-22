import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/auth_user.dart';
import 'package:sofra/resources/exceptions.dart';
import '../screens/signup_screen.dart';
import '../screens/order_details_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routename = '/Login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailcontroler = TextEditingController();

  final _passwordcontroler = TextEditingController();

  Map<String, String> _authDate = {
    'email': '',
    'password': '',
  };

  bool _isLoading = false;

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
    try {
      await Provider.of<AuthUser>(context, listen: false)
          .signIn(_authDate['email'], _authDate['password']);
    } on ExccptionError catch (error) {
      var errorMessage = 'هناك خطأ ما !';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This eamil address is already in use.';
        _emailcontroler.clear();
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'بريد الكتروني غير صحيح';
        _emailcontroler.clear();
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'كلمة سر ضعيفة';
        _passwordcontroler.clear();
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'بريد الكتروني غير مسجل';
        _emailcontroler.clear();
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'كلمة سر غير صحيحة';
        _passwordcontroler.clear();
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'هناك خطأ ما من فضلك حاوب لاحقاَ';
      _emailcontroler.clear();
      _passwordcontroler.clear();
      _showErrorDialog(errorMessage);
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height*0.5,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'تسجبل الدخول',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            _loginInput(
                                Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                'البريد الالكتروني',
                                TextInputType.emailAddress, onsave: (value) {
                              _authDate['email'] = value.toString();
                            }),
                            _loginInput(
                                Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                'كلمة المرور',
                                TextInputType.number,
                                password: true, onsave: (value) {
                              _authDate['password'] = value.toString();
                            }),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              child: Text(
                                'هل نسيت كلمة المرور؟',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            RaisedButton(
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
                                  'دخول',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black54,
                    child: Wrap(
                      spacing: 5,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignupScreen.routename);
                            },
                            child: Text(
                              'اضغط هنا',
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
