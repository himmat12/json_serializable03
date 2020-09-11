import 'package:flutter/material.dart';
import 'package:json_serializable03/district_list_page.dart';
import 'package:json_serializable03/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      home: DistrictListPage(),
    );
  }
}
