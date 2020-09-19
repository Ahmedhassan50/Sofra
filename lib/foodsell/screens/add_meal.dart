import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodsell/model/meal.dart';
import 'package:sofra/foodsell/provider/meal_sell_provider.dart';
import 'package:sofra/provider/main_sell_provider.dart';
import 'package:sofra/screens/main_sell.dart';
import 'package:sofra/widgets/navigationbar.dart';
import 'package:path/path.dart' as path;

class AddMeal extends StatefulWidget {
  static const routname = '/Add_Meal';

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final _textNameController = TextEditingController();
  final _textDesController = TextEditingController();
  final _textPriceController = TextEditingController();
  final _textPriceOfferController = TextEditingController();
  final _textTimeOrdercontroller = TextEditingController();

  String _error_Name_message;
  String _error_Des_message;
  String _error_Pric_emessage;
  String _error_PriceO_nmessage;
  String _error_Time_message;

  bool _isLoading = false;

  Future<void> _submit() async {
    final mealData = Provider.of<MealSellProvider>(context, listen: false);

    await mealData.addMeal(Meal(
      id: null,
      name: _textNameController.text,
      describtion: _textDesController.text,
      price: double.parse(_textPriceController.text),
      price_in_offer: double.parse(_textPriceOfferController.text),
      time_of_order: int.parse(_textTimeOrdercontroller.text),
    ));
  }

  void _validation() {
    setState(() {
      //name
      if (_textNameController.text.isEmpty) {
        _error_Name_message = 'من فضلك ادخل اسم الوجبة';
      } else if (double.tryParse(_textNameController.text) != null) {
        _error_Name_message = 'من فضل ادخل قيمة صحيحة';
      } else {
        _error_Name_message = null;
      }

      //describtion
      if (_textDesController.text.isEmpty) {
        _error_Des_message = 'من فضلك ادخل وصف الوجبة';
      } else if (double.tryParse(_textDesController.text) != null) {
        _error_Des_message = 'من فضل ادخل قيمة صحيحة';
      } else {
        _error_Des_message = null;
      }

      //price
      if (_textPriceController.text.isEmpty) {
        _error_Pric_emessage = 'من فضلك ادخل سعر الوجبة';
      } else if (double.tryParse(_textPriceController.text) == null) {
        _error_Pric_emessage = 'من فضل ادخل قيمة صحيحة';
      } else {
        _error_Pric_emessage = null;
      }
      //price in  offer
      if (_textPriceOfferController.text.isEmpty) {
        _error_PriceO_nmessage = 'من فضلك ادخل سعر الوجبة في العرض';
      } else if (double.tryParse(_textPriceOfferController.text) == null) {
        _error_PriceO_nmessage = 'من فضل ادخل قيمة صحيحة';
      } else {
        _error_PriceO_nmessage = null;
      }
      //time
      if (_textTimeOrdercontroller.text.isEmpty) {
        _error_Time_message = 'من فضلك ادخل مدة تجهيز الوجبة';
      } else if (double.tryParse(_textTimeOrdercontroller.text) == null) {
        _error_Time_message = 'من فضل ادخل قيمة صحيحة';
      } else {
        _error_Time_message = null;
      }
    });

    if (_error_Name_message == null &&
        _error_Des_message == null &&
        _error_Pric_emessage == null &&
        _error_PriceO_nmessage == null &&
        _error_Time_message == null) {
      _isLoading = true;
      _submit().then((value) {
        _isLoading = false;
        Navigator.of(context).pop();
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainsell = Provider.of<MainSell>(context, listen: false);
    final mealData = Provider.of<MealSellProvider>(context, listen: false);
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
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: LayoutBuilder(
          builder: (ctx, constrains) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                  minWidth: constrains.maxWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'إضافة صورة للمنتج',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () async {
                        await mainsell.getImageFile().then((value) {
                          mealData.image = value;
                          mealData.fileName = path.basename(value.path);
                        });
                        setState(() {});
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          image: mealData.image != null
                              ? DecorationImage(
                                  image: FileImage(mealData.image),
                                  fit: BoxFit.cover)
                              : null,
                        ),
                        child: mealData.image == null
                            ? Icon(
                                Icons.image,
                                size: 50,
                              )
                            : null,
                      ),
                    ),
                    _mealInfo(' اسم المنتج',
                        textcontroller: _textNameController,
                        onSubmit: _submit,
                        errormessage: _error_Name_message),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        controller: _textDesController,
                        onSubmitted: (_) => _submit,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'وصف مختصر',
                            errorText: _error_Des_message != null
                                ? _error_Des_message
                                : null,
                            errorStyle: TextStyle(color: Colors.red)),
                        maxLines: 4,
                      ),
                    ),
                    _mealInfo('السعر',
                        textcontroller: _textPriceController,
                        onSubmit: _submit,
                        errormessage: _error_Pric_emessage),
                    _mealInfo('السعر في العرض',
                        textcontroller: _textPriceOfferController,
                        onSubmit: _submit,
                        errormessage: _error_PriceO_nmessage),
                    _mealInfo('مدة تجهيز الطلب',
                        textcontroller: _textTimeOrdercontroller,
                        onSubmit: _submit,
                        errormessage: _error_Time_message),
                    RaisedButton(
                      onPressed: () {
                        _validation();

                        //Navigator.of(context).pushNamed(UpdateMeal.routename);
                        // Navigator.of(context).pushReplacementNamed(OrderDetails.routename);
                      },
                      color: Color(0xFFC2185B),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 50),
                        child: Text(
                          'اضف',
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
        ),
      ),
    );
  }

  Widget _mealInfo(String hint,
      {TextEditingController textcontroller,
      Function onSubmit,
      String errormessage}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: textcontroller,
        onSubmitted: (_) => onSubmit,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: hint,
            errorText: errormessage != null ? errormessage : null,
            errorStyle: TextStyle(color: Colors.red)),
      ),
    );
  }
}
