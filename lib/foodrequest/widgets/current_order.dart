import 'package:flutter/material.dart';

class CurrentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
       vertical: 20,
      // horizontal: 20 
       
      ),
      itemCount: 10,
      itemBuilder: (ctx,i)=>Container(
        padding: EdgeInsets.only(
          bottom: 10
        ),
        alignment: Alignment.center,
         decoration: BoxDecoration(
           border:Border(
             bottom: BorderSide(
               width: 2,
               color:Colors.grey[200]
             )
           )
         ),
        margin: EdgeInsets.only(
          bottom: 10
        ),
        child: Row(
         
          children: <Widget>[
          CircleAvatar(
          
            backgroundColor: Colors.pink,
            backgroundImage: AssetImage('assets/images/homebackground2.jpg'),
            maxRadius: 50,
           
          ),
          
          Padding(
            padding: const EdgeInsets.only(
              right: 10
            ),
            child: Wrap(
              alignment: WrapAlignment.start,
             direction: Axis.vertical,
             children: <Widget>[
               Text('دجاج كنتاكي',style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20
               ),),
             Text('رقم الطلب :12356',style: TextStyle(
               color: Colors.grey
             ),),
             Text('الاجمالي :100 جنية',style: TextStyle(
               color: Colors.grey
             ),),
         ],),
          ),

        Container(
          alignment: Alignment.centerLeft,
           width: MediaQuery.of(context).size.width*0.35,
                    child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.end,
             children: <Widget>[
               RaisedButton(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30)
                 ),
                 color: Colors.green,
                 child: Text('استلام',style: TextStyle(
                   color: Colors.white
                 ),),
                 onPressed: (){}),
               RaisedButton(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30)
                 ),
                 color: Colors.red,
                  child: Text('رفض',style: TextStyle(
                   color: Colors.white
                 ),),
                 onPressed: (){}),

           ],),
         )
          


        ],),
      )
      
      
      );
  }
}