import 'dart:io';

import 'package:flutter/foundation.dart';
import '../foodsell/screens/home_sell.dart';
import '../foodsell/screens/order_sell.dart';
import '../foodsell/screens/profile_sell.dart';
import '../foodsell/screens/other_sell.dart';
import 'package:image_picker/image_picker.dart';



class MainSell with ChangeNotifier{
int index=0;
final _bages=[
HomeSell(),
OrderSell(),
ProfileSell(),
OthersSell(),
];
get getpage=>_bages;

void changepage(int page){
   
     index=page;
 notifyListeners();  
}

Future<File>getImageFile()async{
  File imageFile=await ImagePicker.pickImage(source: ImageSource.gallery);
  return imageFile;
}

}