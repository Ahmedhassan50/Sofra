import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/provider/main_sell_provider.dart';
import 'package:sofra/screens/main_sell.dart';
import 'package:sofra/widgets/navigationbar.dart';

class AddOfferSell extends StatelessWidget {
  static const routename = '/Add_Offers_sell';

  void _pickDate(BuildContext ctx) {
    showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'إضافة صورة للعرض',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  _mealInfo(' اسم العرض'),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'وصف مختصر',
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () => _pickDate(ctx),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          width: 90,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('من'),
                              Icon(Icons.today),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                         onTap:()=> _pickDate(ctx),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          width: 90,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[Text('الي'), Icon(Icons.today)],
                          ),
                        ),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
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
    );
  }

  Widget _mealInfo(String hint) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}
