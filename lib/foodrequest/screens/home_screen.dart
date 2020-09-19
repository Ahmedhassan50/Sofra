import 'package:flutter/material.dart';

import '../widgets/home_row.dart';
import '../widgets/restorunt_list.dart';

class Home_Screen extends StatelessWidget {
  static const routename='/Home-screen';
  @override
  Widget build(BuildContext context) {
    
    return 
      
      Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
        
          children: <Widget>[
            HomeRow(),
            
            SizedBox(height: 50,),
            RestouruntList(),
          ],
        ),
      );
    
  }
}
