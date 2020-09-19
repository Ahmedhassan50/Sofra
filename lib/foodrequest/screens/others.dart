import 'package:flutter/material.dart';
import './offers_screen.dart';
import './contact_us.dart';

class Others extends StatelessWidget {
  static const routename='/Others-screen';
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
              ), 'العروض',(){
                Navigator.of(context).pushNamed(OffersScreen.routename);

              }),
              Divider(
                thickness: 2,
              ),

              _body(Icon(Icons.email,
              color: Colors.black,
              ), 'تواصل معنا',(){
                Navigator.of(context).pushNamed(ContactUs.routename);
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
              _body(Icon(Icons.exit_to_app,
              color: Colors.black,
              ), 'تسجيل الخروج',(){
                _showDialog(context);
              }),
            ],
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