import 'package:flutter/material.dart';

void showInSnackBar(context , String value , {color = Colors.black}) {
  try {
    ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
            backgroundColor: color,
            content: Text('$value', style: Theme
                .of(context)
                .textTheme
                .button
                ?.copyWith(fontSize: 15, color: Colors.white),)));
  }catch(e){
    print(e) ;
  }
}
