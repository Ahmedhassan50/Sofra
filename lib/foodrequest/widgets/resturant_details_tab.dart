import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/screens/meal_order_screen.dart';
import 'package:sofra/foodsell/provider/meal_sell_provider.dart';


class ResDetailsTab extends StatefulWidget {
  @override
  _ResDetailsTabState createState() => _ResDetailsTabState();
}

class _ResDetailsTabState extends State<ResDetailsTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final mainData=Provider.of<MainProvider>(context,listen: false);
     final mealData=Provider.of<MealSellProvider>(context,listen: false);
    return Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 0.6, offset: Offset(0.0, 1.0))
        ], color: Colors.grey[200]),
        child:  TabBar(
                controller: _tabController,
                labelColor: Colors.pink,
                labelPadding: EdgeInsets.symmetric(vertical: 10),
                labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                tabs: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey))),
                      child: Text(
                        'قائمة الطعام',
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.grey))),
                      child: Text(
                        'التعليقات والتقييم',
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: double.infinity,
                      child: Text(
                        'معلومات المتجر',
                        textAlign: TextAlign.center,
                      )),
                ]),
      ),
      Container(
        alignment: Alignment.center,
        
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.45,
        child: TabBarView(controller: _tabController, children: [
          _mealsMenue(mealData),
          _rating(),
         _restorentinfo(),
        ]),
      ),
    ]);
  }








  

  Widget _mealsMenue(MealSellProvider mealData) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: mealData.maels.length,
      itemBuilder: (ctx, i) => Center(
          child: InkWell(
            onTap: ()=>Navigator.of(context).pushNamed(MealOrder.routename,arguments: mealData.maels[i].id),
                      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 0.6, offset: Offset(0.0, 1.0))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/images/homebackground2.jpg'),
                  fit: BoxFit.cover)),
        child: Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  Text(
                    mealData.maels[i].name,
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    mealData.maels[i].describtion,
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'السعر: ${mealData.maels[i].price}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
        ),
        width: 300,
        height: 150,
      ),
          )),
    );
  }

  Widget _rating(){
    return  Column(
      children: <Widget>[
        Text('يسعدنا مشاركتك بتعليق او تقييم'),
        RaisedButton(onPressed: (){
          _showDialog();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: Text('اضف تعليق او تقييم',
          style:TextStyle(color: Colors.white) ,),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        color: Colors.pink,

        ),
        Divider(
          thickness: 2,
          endIndent: 20,
          indent: 20,
        ),
        Expanded(
          
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20
                    ),
            itemCount: 10,
            itemBuilder:(ctx,i)=>
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              elevation: 5,
              child: ListTile(
                title: Text('احمد حسن'),
                subtitle: Text('الراجل دا صح الصح والكبدة صح الصح'),
                trailing: Icon(Icons.face),

              ),
            )
            ),
        ),

    ],);
  }

 Widget _restorentinfo(){
   return Padding(
     padding: const EdgeInsets.all(20),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
 Wrap(
spacing: 100,

     children: <Widget>[
     Text('الحالة'),
     Text('مفتوح'),

 ],),
 Divider(
   thickness: 2,
 ),
 Wrap(
     spacing: 86,
     children: <Widget>[
     Text('المدينة'),
     Text('القاهرة'),

 ],),
 Divider(
   thickness: 2,
 ),
 Wrap(
     spacing: 110,
     children: <Widget>[
     Text('الحي'),
     Text('شبرا'),

 ],),
 Divider(
   thickness: 2,
 ),
 Wrap(
     spacing: 65,
     children: <Widget>[
     Text('الحد الادنى'),
     Text('10 جنية'),

 ],),
 Divider(
   thickness: 2,
 ),
 Wrap(
     spacing: 45,
     children: <Widget>[
     Text('رسوم التوصيل'),
     Text('5 جنية'),

 ],),
 
       ],
     ),
   );
 }
 void _showDialog(){
    showDialog(context: context,builder: (ctx)=>Dialog(

      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height*0.5,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('اختار تقييمك',style: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.sentiment_very_satisfied,
                color: Colors.pink[700],
                size: 40,
                ),
                 Icon(Icons.sentiment_satisfied,
                 color: Colors.pink[700],
                size: 40,
                 ),
                  Icon(Icons.sentiment_neutral,
                  color: Colors.pink[700],
                size: 40,
                  ),
                   Icon(Icons.sentiment_dissatisfied,
                   color: Colors.pink[700],
                size: 40,
                   ),
                    Icon(Icons.sentiment_very_dissatisfied,
                    color: Colors.pink[700],
                size: 40,
                    ),
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 15
              ),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'اضف تعليقك هنا'
                    ),
                    maxLines: 3,
            
          ),
        ),
        RaisedButton(
                      onPressed: () {
                       
                      },
                      color: Color(0xFFC2185B),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                             horizontal: 50
                            ),
                        child: Text(
                          'اضف',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),

          ],
        ),
      ),

    ));
  }


}
