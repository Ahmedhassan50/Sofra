import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/provider/main_provider.dart';

class MainNavbar extends StatelessWidget {
  final Function ontab;
  MainNavbar({@required this.ontab});
  @override
  Widget build(BuildContext context) {
    final mainData=Provider.of<MainProvider>(context,listen: false);
    return BottomNavigationBar(

        onTap: ontab,
        backgroundColor: Color(0xFFC2185B),
        currentIndex:0,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        
       
        elevation: 5,

        items: [
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon:Icon(Icons.home,color: Colors.white,)),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon:Icon(Icons.assignment,color: Colors.white,)
            ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon:Icon(Icons.person_outline,color: Colors.white,)),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon:Icon(Icons.linear_scale,color: Colors.white,)),
          



      ]);
  }

}