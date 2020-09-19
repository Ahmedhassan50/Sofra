import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/provider/main_provider.dart';
import 'package:sofra/screens/main_screen.dart';
import 'package:sofra/widgets/appbar.dart';
import 'package:sofra/widgets/navigationbar.dart';

class OrderDetails extends StatelessWidget {
  static const routename = '/OrderDetails-screen';



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainData=Provider.of<MainProvider>(context,listen: false);
    
    return Scaffold(
      appBar: MainAppbar().appbar(context) ,
      bottomNavigationBar: MainNavbar(ontab: (index){
        mainData.changepage(index);
      
        Navigator.of(context).popUntil( ModalRoute.withName(MainScreen.routename));
      },),



      body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20
          ),
          width: size.width,
         
          child: LayoutBuilder(
            builder: (ctx,constrans){
              return SingleChildScrollView(
                child:ConstrainedBox(
                  constraints:  BoxConstraints(minHeight: constrans.maxHeight),
                                  child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Text('تفاصيل الطلب',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  Card(
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
                          hintText: 'اضف ملاحظات',
                          
                        ),
                        maxLines: 4,
              
            ),
            color: Colors.grey[300],
        ),
        Container(
            alignment: Alignment.centerRight,
            child: Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                  Text('عنوان التوصيل'),
                  Text('شبرا القاهرة',style: TextStyle(
                    color: Colors.pink
                  ),),
                  Text('الدفع'),
              ],
            ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Text('نقداً عند الاستلام'),
                    Radio(value: 1, groupValue: null, onChanged: (_){}),
                  ],
              ),

              Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Text('الدفع اون لاين'),
                    Radio(value: 1, groupValue: null, onChanged: (_){}),
                  ],
              )
              
            ],
        ),
        Container(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              elevation: 5,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text('المجموع:100 جنية'),
                      Text('سعر التوصبل:10 جنية'),
                      Text('المبلغ الاجمالي:110 جنية'),
                    ],
                  ),
              ),
            ),
        ),

        RaisedButton(onPressed: (){},
                          color: Color(0xFFC2185B),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,

                              horizontal: 50
                            ),
                            child: Text('تأكيد الطلب',style: TextStyle(
                              color: Colors.white
                            ),),
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          ),


                          )









              ],
            ),
                ), 
              );

            },

            
                    
          ),

        ) ,
        

      
    );
  }
}