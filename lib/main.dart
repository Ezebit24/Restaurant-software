import 'package:flutter/material.dart';
import 'package:restureant_app/Screens/Chef/home/active.dart';
import 'package:restureant_app/Screens/Chef/home/staff.dart';
import 'package:restureant_app/Screens/Chef/home/table_stat.dart';
import 'package:restureant_app/Screens/Chef/maincourse.dart';
import 'package:restureant_app/tests/thome.dart';

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
      home: TableStatus(),
    );
  }
}
