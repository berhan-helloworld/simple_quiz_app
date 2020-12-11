import 'package:flutter/material.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white, scaffoldBackgroundColor: Colors.white70),
    );
  }
}
