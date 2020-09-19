import 'package:flutter/material.dart';
import 'package:sofra/foodsell/screens/offers_sell.dart';


class OthersSell extends StatelessWidget {
  static const routename='/Others-sell';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: SafeArea(
                      child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('المزيد',textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  ),
                  _body(Icon(Icons.card_giftcard,
                  color: Colors.black,
                  ), 'عروضي',(){
                  Navigator.of(context).pushNamed(OffersSell.routename);
                  }),
                  Divider(
                    thickness: 2,
                  ),

                  _body(Icon(Icons.mail_outline,
                  color: Colors.black,
                  ), 'تواصل معنا',(){
                   
                  }),
                   Divider(
                    thickness: 2,
                  ),
                  _body(Icon(Icons.lightbulb_outline,
                  color: Colors.black,
                  ), 'عن التطبيق',(){}),
                   Divider(
                    thickness: 2,
                  ),
                  _body(Icon(Icons.star,
                  color: Colors.black,
                  ), 'التعليقات و التقييم',(){}),
                   Divider(
                    thickness: 2,
                  ),
                  _body(Icon(Icons.exit_to_app,
                  color: Colors.black,
                  ), 'تسجيل الخروج',(){
                    _showDialog(context);
                  }),
                ],
              ),
            ),
          ),
    );

     
  }
  Widget _body(Icon icon,String title,Function onpress){
    return 
        ListTile(
          leading: icon,
          title:Text(title),
          onTap: onpress,
        );
        

  }

  void _showDialog(BuildContext cotx){
    showDialog(context: cotx,builder: (ctx)=>AlertDialog(
      content:Wrap(
        
        spacing: 15,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
           Text('هل انت متاكد من الخروج؟',
      textAlign:TextAlign.center ,),
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          RaisedButton(onPressed: (){},
          color: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.check,color: Colors.red,),
        ),
        RaisedButton(onPressed: (){},
        color: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.clear,color: Colors.black,),
        ),
        ],)
        ],
      ),
      
      
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 5,
      
      

      actions: <Widget>[
       
        
      ],
    ));
  }
}