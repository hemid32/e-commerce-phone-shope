import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
      headline5: TextStyle(
      fontWeight: FontWeight.bold
      ) ,
        button: TextStyle(
            fontWeight: FontWeight.bold
        )

    ),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

