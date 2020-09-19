import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/cart_provider.dart';

class CartList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final cartData=Provider.of<Cart>(context);
    return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.5,
             
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  //horizontal: 10
                ),
                itemCount: cartData.itemCount,
                itemBuilder: (ctx,i)=>Container(
                  padding: EdgeInsets.only(
                    bottom: 10
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                  image: DecorationImage(
                    image: AssetImage('assets/images/homebackground2.jpg'),
                    fit: BoxFit.cover
                  )

                ),

              ),

              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 15,
                      children: <Widget>[
                        Text(cartData.items.values.toList()[i].name,style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                         Text('${cartData.items.values.toList()[i].price} جنية'),
                      ],
                    ),

                    Row(children: <Widget>[
            Text('الكمية'),
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
             
      
         RawMaterialButton(onPressed: (){
           cartData.addSingleItem(cartData.items.keys.toList()[i]);
         },
                child: Icon(Icons.add),
                fillColor:Colors.white ,
                shape: CircleBorder(),
                constraints: BoxConstraints(
                 
                ),
                ),

                Card(
                   child: Container(
                     alignment: Alignment.center,
                     width: 84,
                     height: 30,
                     child: Text('${cartData.items.values.toList()[i].quantity}',style: TextStyle(
                       color: Colors.black,
                       fontSize: 20
                     ),)),
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),

                ),
                     
        
         RawMaterialButton(onPressed: (){
           cartData.removeSingleItem(cartData.items.keys.toList()[i]);
         },
                child: Icon(Icons.remove),
                fillColor:Colors.white ,
                shape: CircleBorder(),
                constraints: BoxConstraints(
                 
                ),
                ),

                      
        
                
            ],)
          ],),
                  ],
                ),
              

         RawMaterialButton(onPressed: (){
            cartData.removeItem(cartData.items.keys.toList()[i]);
         },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.clear,
                  size: 15,
                  color: Colors.white,),
                ),
                fillColor:Colors.pink ,
                shape: CircleBorder(),
                constraints: BoxConstraints(
                 
                ),
                ),

              
       
                  ],),
                )
                ),
            );
  }
}