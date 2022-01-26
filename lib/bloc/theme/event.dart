import 'package:flutter/material.dart';
import 'package:phoneshop/oitil/storeageManage/storageManage.dart';
import 'package:phoneshop/oitil/theme/theme.dart';

class EventThemeMode {}



class EventsChangeThemeMode extends EventThemeMode {

  final bool value;
  EventsChangeThemeMode({this.value}); // dark or light






  changeMode() async {
    if (value == true) {
      setDarkMode();
      return ThemeMode.dark;
    } else if (value == false) {
      setLightMode();
      return ThemeMode.light;
    }
  }
    /*
    String currentMode =  await StorageManager.readData('themeMode') ;
    if(currentMode == 'dark') {
      setLightMode();
      return ThemeMode.light ;
    }
    else if(currentMode == 'light'){
      setDarkMode();
      return ThemeMode.dark ;
    } else if(currentMode == null){
      setLightMode();
      return ThemeMode.light ;
    }
   }

     */

  void setDarkMode() async {
    //_themeData = themeLigth;
    StorageManager.saveData('themeMode', 'dark');
    //print('set theme ==== dark') ;
  }

  void setLightMode() async {
    //_themeData = themeDark;
    StorageManager.saveData('themeMode', 'light');
    //print('set theme ==== light') ;

  }



}


class EventsThemeChangedInitilis extends EventThemeMode {



  getTheme()async {
    String currentMode =  await StorageManager.readData('themeMode') ;
    if(currentMode == 'dark'){
      return ThemeMode.dark ;
    }else {
      return ThemeMode.light ;
    }
  }


}