import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodsell/model/meal.dart';
import 'package:sofra/foodsell/provider/meal_sell_provider.dart';
import 'package:sofra/provider/main_sell_provider.dart';
import 'package:sofra/screens/main_sell.dart';
import 'package:sofra/widgets/navigationbar.dart';

class UpdateMeal extends StatefulWidget {
  static const routename = '/Update_meal';

  @override
  _UpdateMealState createState() => _UpdateMealState();
}

class _UpdateMealState extends State<UpdateMeal> {
  
  final _form = GlobalKey<FormState>();
  Meal _newMeal;
  var _initvalue={
  'name':'',
  'describtion':'',
  'price':'',
  'price_in_offer':'',
  'time_of_order':'',
  };
  var _isinit=true;

  @override
  void didChangeDependencies() {
    if(_isinit){
   final mealId = ModalRoute.of(context).settings.arguments as String;
   final mealData =Provider.of<MealSellProvider>(context, listen: false).findByid(mealId);
    _newMeal=mealData;
    _initvalue={
   'name':mealData.name,
   'describtion':mealData.describtion,
   'price':mealData.price.toString(),
   'price_in_offer':mealData.price_in_offer.toString(),
   'time_of_order':mealData.time_of_order.toString(),
    };

 }
        _isinit=false;
    super.didChangeDependencies();
  }

  Future<void> _submit()async {
    final _isvaled=_form.currentState.validate();
    if(!_isvaled){return;}
    _form.currentState.save();
    if(_newMeal.id!=null){
    await Provider.of<MealSellProvider>(context,listen:false).updateMeal(_newMeal.id, _newMeal);
    }
    Navigator.of(context).pop();
   
  }

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
      body: LayoutBuilder(
        builder: (ctx, constrains) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constrains.maxHeight, minWidth: constrains.maxWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'صورة للمنتج',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    _mealInfo(_initvalue['name'],
                     (value){
                     if(value.toString().isEmpty){
                       return 'من فضلك ادخل اسم الوجبة';
                     }
                     if(double.tryParse(value.toString())!=null){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     return null;
                     },
                     (value){
                       _newMeal=Meal(id:_newMeal.id, name: value.toString(), describtion: _newMeal.describtion,
                        price: _newMeal.price,price_in_offer: _newMeal.price_in_offer,time_of_order: _newMeal.time_of_order);
                     }
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        validator: (value){
                     if(value.toString().isEmpty){
                       return 'من فضلك ادخل وصف الوجبة';
                     }
                     if(double.tryParse(value.toString())!=null){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     return null;
                     }
                    ,
                    onSaved:  (value){
                       _newMeal=Meal(id:_newMeal.id, name:_newMeal.name , describtion: value.toString(),
                        price: _newMeal.price,price_in_offer: _newMeal.price_in_offer,time_of_order: _newMeal.time_of_order);
                     },
                        initialValue:_initvalue['describtion'] ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        maxLines: 4,
                      ),
                    ),
                    _mealInfo(_initvalue['price'],
                     (value){
                     if(value.toString().isEmpty){
                       return 'من فضلك ادخل سعر الوجبة';
                     }
                     if(double.tryParse(value.toString())==null){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     if(double.parse(value.toString())<=0){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     return null;
                     },
                     (value){
                       _newMeal=Meal(id:_newMeal.id, name:_newMeal.name , describtion: _newMeal.describtion,
                        price: double.parse(value),price_in_offer: _newMeal.price_in_offer,time_of_order: _newMeal.time_of_order);
                     },
                     
                    ),
                    _mealInfo(_initvalue['price_in_offer'],
                     (value){
                     if(value.toString().isEmpty){
                       return 'من فضلك ادخل سعر الوجبة في العرض';
                     }
                     if(double.tryParse(value.toString())==null){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     if(double.parse(value.toString())<=0){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     return null;
                     },
                     (value){
                       _newMeal=Meal(id:_newMeal.id, name:_newMeal.name , describtion: _newMeal.describtion,
                        price:_newMeal.price ,price_in_offer: double.parse(value),time_of_order: _newMeal.time_of_order);
                     },
                    ),
                    _mealInfo(_initvalue['time_of_order'],
                    (value){
                     if(value.toString().isEmpty){
                       return 'من فضلك ادخل مدة تجهيز الوجبة';
                     }
                     if(int.tryParse(value.toString())==null){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     if(int.parse(value.toString())<=0){
                       return 'من فضل ادخل قيمة صحيحة';
                     }
                     return null;
                     },
                      (value){
                       _newMeal=Meal(id:_newMeal.id, name:_newMeal.name , describtion: _newMeal.describtion,
                        price:_newMeal.price ,price_in_offer:_newMeal.price_in_offer ,time_of_order: int.parse(value));
                     },
                     submit: (_)=>_submit
                    ),
                    
                    
                    RaisedButton(
                      onPressed: () {
                        _submit();
                        
                        // Navigator.of(context).pushNamed(UpdateMeal.routename);
                        // Navigator.of(context).pushReplacementNamed(OrderDetails.routename);
                      },
                      color: Color(0xFFC2185B),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 50),
                        child: Text(
                          'تعديل',
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

  Widget _mealInfo(String initvalue,Function validator,Function save,{TextEditingController textcontroller, Function submit}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: initvalue,
        validator:validator ,
        onSaved: save,
        onFieldSubmitted: submit,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),

    
    );
  }
}
