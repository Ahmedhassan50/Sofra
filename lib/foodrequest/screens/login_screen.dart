import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';
import '../screens/order_details_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routename='/Login-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Stack(children: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
             
              image: DecorationImage(
                image:AssetImage('assets/images/homebackground.jpg'),
                fit: BoxFit.cover
                )
            ),
          ),
          Opacity(
            opacity: 0.4,
                      child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
          ),

          Column(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                   // height: MediaQuery.of(context).size.height*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Text('تسجبل الدخول',style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),),
                      _loginInput(Icon(Icons.email,color: Colors.white,),
                      'البريد الالكتروني',
                      TextInputType.emailAddress,
                      ),
                      _loginInput(Icon(Icons.lock,color: Colors.white,),
                      'كلمة المرور',
                      TextInputType.number,
                      password: true
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Text('هل نسيت كلمة المرور؟',style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                      RaisedButton(onPressed: (){
                        Navigator.of(context).pushReplacementNamed(OrderDetails.routename);
                      },
                      color: Color(0xFFC2185B),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,

                          horizontal: 50
                        ),
                        child: Text('دخول',style: TextStyle(
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
                ),
                Container(
                width: double.infinity,
                color: Colors.black54,
                child:Wrap(
                  spacing: 5,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                  Text('ليس لديك حساب؟',style: TextStyle(
                    color: Colors.white
                  ),),
                  InkWell(onTap: (){
                    Navigator.of(context).pushReplacementNamed(SignupScreen.routename);
                  },child: Text('اضغط هنا',style: TextStyle(
                    color: Colors.blue
                  ),)),
                  
                  
                ],),
              ),

              ],
            ),
          

         
        ],
              
        ) ,
        ),
      
    );
  }

 Widget _loginInput(Icon icon,String text,TextInputType type,{bool password=false}){
   return TextField(
     style: TextStyle(color: Colors.white),
     obscureText: password,
     keyboardType:type ,
     decoration: InputDecoration(
       
       enabledBorder: UnderlineInputBorder(
         borderSide: BorderSide(color: Colors.white)
       ),
       prefixIcon: icon,
       
       
       hintText: text,
       hintStyle: TextStyle(
         color: Colors.white
       )
     ),

   );
 }

}