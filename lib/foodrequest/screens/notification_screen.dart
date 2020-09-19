import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';

class NotificationsScreen extends StatelessWidget {
  static const routename='/Notifications-screen';
  @override
  Widget build(BuildContext context) {
   
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
                Icons.shopping_cart,
                color: Colors.pink,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, CartScreen.routename);
              })
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[400],
      body: Column(
       
        children: <Widget>[
          Expanded(
            child:ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10
              ),
              itemCount: 10,
              itemBuilder:(ctx,i)=>Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
               child: ListTile(
                 leading: Icon(Icons.notifications_active),
                 title: 
                   Text('هناك حقيقة مؤكدة ان المحشي يزيد الوزن',style: 
                   TextStyle(
                     fontSize: 12
                   ),),
                  
                 trailing: Wrap(
                   children: <Widget>[
                     Icon(Icons.access_time,size: 20,color: Colors.black,),
                     Text('منذ 10 دقائق',
                     style: TextStyle(
                       fontSize: 10
                     ),),
                   ],
                   spacing: 8,
                 )
                   
                 
               ),
              ) 
            
            
            ),
            
            
            
             ),
        ],
      ),
      
    );
  }
}