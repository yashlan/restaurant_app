import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/constant/constant.dart';
import 'package:restaurant_app/detail_restaurant/detail_restaurant_screen.dart';
import 'package:restaurant_app/list_restaurant/list_restaurant_screen.dart';
import 'package:restaurant_app/model/local_restaurant.dart';
import 'package:restaurant_app/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: kIsWeb ? routeHomeScreen : routeInitial,
      routes: {
        routeInitial: (context) => const SplashScreen(),
        routeHomeScreen: (context) => const ListRestaurantScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == routeDetailScreen) {
          final restaurantArgs = settings.arguments as Restaurant;
          return MaterialPageRoute(
            builder: (context) {
              return DetailRestaurantScreen(
                restaurant: restaurantArgs,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
