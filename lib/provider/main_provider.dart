import 'package:flutter/foundation.dart';
import '../foodrequest/screens/home_screen.dart';
import '../foodrequest/screens/orders_screen.dart';
import '../foodrequest/screens/others.dart';
import '../foodrequest/screens/profile_screen.dart';

class MainProvider with ChangeNotifier{
int index=0;
final _bages=[
   Home_Screen(),
   OrdersScreen(),
   ProfileScreen(),
   Others(),
  // RestoruntDetails(),
   //MealOrder(),

 ];

 get getpage=>_bages;

void changepage(int page){
   
     index=page;
 notifyListeners();  
}
}