import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sofra/provider/main_provider.dart';
import 'package:sofra/screens/main_screen.dart';
import 'package:sofra/widgets/appbar.dart';
import 'package:sofra/widgets/navigationbar.dart';
import '../widgets/resturant_details_tab.dart';

class RestoruntDetails extends StatelessWidget {
  static const routename='/restount-screen';
  @override
  Widget build(BuildContext context) {


    final mainData=Provider.of<MainProvider>(context,listen: false);
   

    return Scaffold(
      appBar: MainAppbar().appbar(context) ,
      bottomNavigationBar: MainNavbar(ontab: (index){
        mainData.changepage(index);
      
        Navigator.of(context).popUntil( ModalRoute.withName(MainScreen.routename));
      },),






      body: 
         Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10
            ),
            child: SingleChildScrollView(
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage('assets/images/homebackground2.jpg'),
                        maxRadius: 70,
                      ),
                      Text(
                        'دجاج كنتاكي',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  
                 ResDetailsTab(),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
