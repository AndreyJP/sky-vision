import 'package:flutter/material.dart';
import 'package:sky_vision/view/city_page.dart';
import 'package:sky_vision/view/home_page.dart';
import 'package:sky_vision/view/login_page.dart';
import 'package:sky_vision/view/search_city.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sky Vision',
      initialRoute: '/',
      routes: {
        '/':(context) => const HomePage(),
        '/login':(context) => const LoginPage(),
        '/skyvision/search':(context) => const SearchCity(),
        '/skyvision/city':(context) => const CityPage(),
      },
    );
  }
}
