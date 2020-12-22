import 'package:flutter/material.dart';
import 'package:sofra/foodrequest/provider/auth_user.dart';
import 'package:sofra/foodrequest/provider/cart_provider.dart';
import 'package:sofra/foodrequest/provider/notification_provider.dart';
import 'package:sofra/foodrequest/provider/order_provider.dart';
import 'package:sofra/foodsell/provider/auth_sell.dart';
import 'package:sofra/foodsell/provider/meal_sell_provider.dart';
import 'package:sofra/provider/main_sell_provider.dart';
import './homepage_screen.dart';
import '../foodrequest/screens/orders_screen.dart';
import '../foodrequest/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../foodrequest/screens/notification_screen.dart';
import '../foodrequest/screens/restorunt_details_screen.dart';
import '../foodrequest/screens/meal_order_screen.dart';
import '../foodrequest/screens/cart_screen.dart';
import '../foodrequest/screens/profile_screen.dart';
import '../foodrequest/screens/others.dart';
import './main_screen.dart';
import 'package:provider/provider.dart';
import '../provider/main_provider.dart';
import '../foodrequest/screens/login_screen.dart';
import '../foodrequest/screens/signup_screen.dart';
import 'package:flutter/services.dart';
import '../foodrequest/screens/order_details_screen.dart';
import '../foodrequest/screens/offers_screen.dart';
import '../foodrequest/screens/contact_us.dart';
import '../foodsell/screens/login_screen.dart';
import '../foodsell/screens/signup_sell.dart';
import '../foodsell/screens/home_sell.dart';
import '../foodsell/screens/order_sell.dart';
import '../foodsell/screens/profile_sell.dart';
import '../foodsell/screens/other_sell.dart';
import './main_sell.dart';
import '../foodsell/screens/add_meal.dart';
import '../foodsell/screens/update_meal.dart';
import '../foodsell/screens/offers_sell.dart';
import '../foodsell/screens/add_offer_sell.dart';
import '../foodsell/screens/update_offer.dart';
import '../foodsell/provider/resturant_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);*/
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[200],
      statusBarBrightness: Brightness.dark,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MainProvider()),
        ChangeNotifierProvider.value(
          value: MainSell(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(value: AuthUser()),
        ChangeNotifierProxyProvider<AuthUser, OrderProvider>(
            create: (BuildContext context) => OrderProvider(),
            update: (ctx, auth, order) =>
                OrderProvider(token: auth.token, userId: auth.userId)),
        ChangeNotifierProvider.value(
          value: AuthSell(),
        ),
        ChangeNotifierProxyProvider<AuthSell, Restaurant_Provider>(
          create: (BuildContext context) => Restaurant_Provider(),
          update: (ctx, auth, res) =>
              Restaurant_Provider(authToken: auth.token, userId: auth.userId),
        ),
        ChangeNotifierProxyProvider<AuthSell, MealSellProvider>(
          create: (BuildContext context) => MealSellProvider(),
          update: (ctx, auth, res) =>
              MealSellProvider(authToken: auth.token, userId: auth.userId),
        ),
        ChangeNotifierProvider.value(
          value: NotificationProvider()
          )

        /*ChangeNotifierProxyProvider<Restaurant_Provider,MealSellProvider>(
          create: (BuildContext context) =>MealSellProvider(),
          update: (ctx, res, meal) => MealSellProvider(id:res.resturant[0].id ),
        )*/
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar'),
        ],
        locale: Locale('ar'),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'cairo',
          primaryColor: Colors.grey[200],
          primarySwatch: Colors.pink,
        ),
        title: 'سفرة',
        initialRoute: HomeScreen.routename,
        routes: {
          HomeScreen.routename: (ctx) => HomeScreen(),
          MainScreen.routename: (ctx) => MainScreen(),
          CartScreen.routename: (ctx) => CartScreen(),
          Home_Screen.routename: (ctx) => Home_Screen(),
          MealOrder.routename: (ctx) => MealOrder(),
          NotificationsScreen.routename: (ctx) => NotificationsScreen(),
          OrdersScreen.routename: (ctx) => OrdersScreen(),
          Others.routename: (ctx) => Others(),
          ProfileScreen.routename: (ctx) => ProfileScreen(),
          RestoruntDetails.routename: (ctx) => RestoruntDetails(),
          LoginScreen.routename: (ctx) => LoginScreen(),
          SignupScreen.routename: (ctx) => SignupScreen(),
          OrderDetails.routename: (ctx) => OrderDetails(),
          OffersScreen.routename: (ctx) => OffersScreen(),
          ContactUs.routename: (ctx) => ContactUs(),
          LoginSell.routename: (ctx) => LoginSell(),
          SignupSell.routename: (ctx) => SignupSell(),
          HomeSell.routename: (ctx) => HomeSell(),
          OrderSell.routename: (ctx) => OrderSell(),
          ProfileSell.routename: (ctx) => ProfileSell(),
          OthersSell.routename: (ctx) => OthersSell(),
          MainSellScreen.routename: (ctx) => MainSellScreen(),
          AddMeal.routname: (ctx) => AddMeal(),
          UpdateMeal.routename: (ctx) => UpdateMeal(),
          OffersSell.routename: (ctx) => OffersSell(),
          AddOfferSell.routename: (ctx) => AddOfferSell(),
          UpdateOffer.routename: (ctx) => UpdateOffer(),
        },
      ),
    );
  }
}
