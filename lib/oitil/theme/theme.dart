import 'package:flutter/material.dart';
import 'package:phoneshop/oitil/storeageManage/storageManage.dart';

import '../../constant.dart';


ThemeData themeLigth = ThemeData(
// Define the default brightness and colors.
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kBackgroundColor,
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  cardColor: Colors.transparent ,
  accentColor: Colors.white,

  buttonColor: Colors.black.withOpacity(0.090) ,


// Define the default font family.
  fontFamily: 'Georgia',
  iconTheme: IconThemeData(
      color: Colors.black.withOpacity(0.4) ,
      size: 30
  ),
  //primaryColorDark: Color(0xFFFF090A1F),


// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    button: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: Colors.black.withOpacity(0.4)),
    headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold , color: Colors.black.withOpacity(0.6)),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0 , color: Colors.black.withOpacity(0.3)),
    headline2:  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold , color: Colors.black.withOpacity(0.6)),

  ),
);
ThemeData themeDark = ThemeData(
// Define the default brightness and colors.
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor:  Color(0xFF1C1C28),
  brightness: Brightness.dark,
  //primaryColorDark: Color(0xFF1C1C28),
  backgroundColor: Color(0xFF1C1C28),
  accentColor: Color(0xFF28293D),

  cardColor: Color(0xFF28293D) ,
  buttonColor: Colors.white.withOpacity(0.090) ,




  iconTheme: IconThemeData(
    color: Colors.white ,
    size: 30
  ),

  //primarySwatch: Colors.black,
// Define the default font family.
  fontFamily: 'Georgia',

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    button: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: Colors.white),
    headline1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold , color: Colors.white),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0 , color: Colors.white.withOpacity(0.3)),
    headline2:  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold , color:  Colors.white),
  ),
);


class ThemeManage  {
  /*
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

   */

  //ThemeData _themeData;
  //ThemeData getTheme() => _themeData;
  /*
  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = themeLigth;
      } else {
        print('setting dark theme');
        _themeData = themeDark;
      }
      notifyListeners();
    });
  }

   */

  void setDarkMode() async {
    //_themeData = themeLigth;
    StorageManager.saveData('themeMode', 'dark');
  }

  void setLightMode() async {
    //_themeData = themeDark;
    StorageManager.saveData('themeMode', 'light');
  }
}

