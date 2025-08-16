import 'package:flutter/material.dart';
import 'package:restureant_app/Screens/chefdash.dart';
import 'package:restureant_app/Screens/home.dart';
import 'package:restureant_app/Screens/order.dart';
import 'package:restureant_app/onboarding_pages/initial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotbox Kitchen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Orders(),
    );
  }
}
