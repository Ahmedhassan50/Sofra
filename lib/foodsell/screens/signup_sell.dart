import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodsell/model/resturant.dart';

import 'package:sofra/foodsell/screens/login_screen.dart';
import '../provider/resturant_provider.dart';
import 'package:sofra/resources/assets_constant.dart';

class SignupSell extends StatefulWidget {
  static const routename = '/Signup-sell';

  @override
  _SignupSellState createState() => _SignupSellState();
}

class _SignupSellState extends State<SignupSell> {
  bool follow = false;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  Map<String, dynamic> resinfo = {
    'name': '',
    'email': '',
    'phone': '',
    'password': '',
    'categories': '',
    'mini': 0.0,
    'dlivery': 0.0,
    'dleviryPhone': '',
    'dlecirywhats': ''
  };
  void _submit() {
    final _isValed = _formKey2.currentState.validate();
    if (!_isValed) {
      return;
    }
    _formKey2.currentState.save();

    Provider.of<Restaurant_Provider>(context, listen: false).addresturant(
        Resturant(
            id: '',
            name: resinfo['name'],
            email: resinfo['email'],
            mobile: resinfo['phone'],
            password: resinfo['password'],
            categories: resinfo['categories'],
            minimum_charge: resinfo['mini'],
            delivery: resinfo['dlivery'],
            deliveryData: DeliveryData(
                mobile: resinfo['dleviryPhone'],
                whatsUp: resinfo['dlecirywhats'])));

    Navigator.of(context).pushReplacementNamed(LoginSell.routename);
  }

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
              child: follow
                  ? _following()
                  : Form(
                      key: _formKey1,
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
                              'اسم المطعم',
                              TextInputType.text, valed: (value) {
                            if (value.toString().isEmpty) {
                              return 'من فضلك ادخل اسم المطعم';
                            }
                            if (double.tryParse(value.toString()) != null) {
                              return 'من فضل ادخل قيمة صحيحة';
                            }
                            return null;
                          }, save: (value) {
                            resinfo['name'] = value;
                          }),
                          _loginInput(
                              Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                              ),
                              'البريد الالكتروني',
                              TextInputType.emailAddress, valed: (value) {
                            if (value.toString().isEmpty ||
                                !(value.toString().contains('@'))) {
                              return 'من فضلك ادخل بريد الكتروني صحيح';
                            }
                            if (double.tryParse(value.toString()) != null) {
                              return 'من فضل ادخل قيمة صحيحة';
                            }
                            return null;
                          }, save: (value) {
                            resinfo['email'] = value;
                          }),
                          _loginInput(
                              Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              'الجوال',
                              TextInputType.phone, valed: (value) {
                            if (value.toString().isEmpty) {
                              return 'من فضلك ادخل رقم الجوال';
                            }
                            if (double.tryParse(value.toString()) == null) {
                              return 'من فضل ادخل قيمة صحيحة';
                            }
                            return null;
                          }, save: (value) {
                            resinfo['phone'] = value;
                          }),
                          _loginInput(
                              Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              'كلمة المرور',
                              TextInputType.number,
                              password: true,
                              valed: (value) {
                                if (value.toString().isEmpty) {
                                  return 'من فضلك ادخل كلمة المرور';
                                }
                                if (value.toString().length < 6) {
                                  return 'من فضلك ادخل قيمة اكبر من 6 احرف';
                                }
                                return null;
                              },
                              controller: _passwordController,
                              save: (value) {
                                resinfo['password'] = value;
                              }),
                          _loginInput(
                              Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              'اعادة كلمة المرور',
                              TextInputType.number,
                              password: true, valed: (value) {
                            if (_passwordController.text != value.toString()) {
                              return 'كلمة المرور ليست مطابقة';
                            }
                            return null;
                          }),
                          Container(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  if (_formKey1.currentState.validate()) {
                                    follow = true;
                                    _formKey1.currentState.save();
                                  }
                                });
                                //  Navigator.of(context).pushReplacementNamed(OrderDetails.routename);
                              },
                              color: Color(0xFFC2185B),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                                child: Text(
                                  'متابعة',
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
      )),
    );
  }

  Widget _following() {
    return Form(
      key: _formKey2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _loginInput(
              Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              'التصنيفات',
              TextInputType.text, valed: (value) {
            if (value.toString().isEmpty) {
              return 'من فضلك ادخل تصنيف المطعم';
            }
            if (double.tryParse(value.toString()) != null) {
              return 'من فضل ادخل قيمة صحيحة';
            }
            return null;
          }, save: (value) {
            resinfo['categories'] = value;
          }),
          _loginInput(
              Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              'الحد الادنى للطلب',
              TextInputType.number, valed: (value) {
            if (value.toString().isEmpty) {
              return 'من فضلك ادخل الحد الادنى للطلب';
            }
            if (double.tryParse(value.toString()) == null) {
              return 'من فضل ادخل قيمة صحيحة';
            }
            return null;
          }, save: (value) {
            resinfo['mini'] = double.parse(value);
          }),
          _loginInput(
              Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              'رسوم التوصيل',
              TextInputType.number, valed: (value) {
            if (value.toString().isEmpty) {
              return 'من فضلك ادخل رسوم التوصيل';
            }
            if (double.tryParse(value.toString()) == null) {
              return 'من فضل ادخل قيمة صحيحة';
            }
            return null;
          }, save: (value) {
            resinfo['dlivery'] = double.parse(value);
          }),
          Text(
            'بيانات التوصيل',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          _loginInput(
              Icon(
                Icons.phone,
                color: Colors.white,
              ),
              'الجوال',
              TextInputType.phone, valed: (value) {
            if (value.toString().isEmpty) {
              return 'من فضلك رقم الجوال';
            }
            if (double.tryParse(value.toString()) == null) {
              return 'من فضل ادخل قيمة صحيحة';
            }
            return null;
          }, save: (value) {
            resinfo['dleviryPhone'] = value;
          }),
          _loginInput(
              Icon(
                Icons.phone,
                color: Colors.white,
              ),
              'الواتس آب',
              TextInputType.phone, valed: (value) {
            if (value.toString().isEmpty) {
              return 'من فضلك ادخل رقم الواتس آب';
            }
            if (double.tryParse(value.toString()) == null) {
              return 'من فضل ادخل قيمة صحيحة';
            }
            return null;
          }, save: (value) {
            resinfo['dlecirywhats'] = value;
          }),
          Text(
            'صورة المتجر',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                  icon: Icon(Icons.store_mall_directory), onPressed: () {}),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () {
                _submit();
              },
              color: Color(0xFFC2185B),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Text(
                  'تسجيل',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          )
        ],
      ),
    );
  }

  Widget _loginInput(Icon icon, String text, TextInputType type,
      {bool password = false,
      Function valed,
      Function save,
      TextEditingController controller}) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: password,
      controller: controller,
      keyboardType: type,
      cursorColor: Colors.white,
      validator: valed,
      onSaved: save,
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          prefixIcon: icon,
          hintText: text,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
