

import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/widgeets/card.dart';
import 'package:phoneshop/screens/homescreen/widgeets/favorite.dart';

import 'costom_listTile.dart';
import 'header_setting.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      //Home()
      //Favorite()
      // CartHome() 
      child: Column(
        children: [
          HeaderSetting(titre:  'Setting App',) , 
          CostomListTile(title: 'Login' , icon: Icons.person,) ,
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
            child: Text('Setting General' , style:  Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.5 )),),
          ) ,
          CostomListTile(title: 'List Favorite' , icon: Icons.favorite, onTap: (){},) ,
          CostomListTile(title: 'Notification' , icon: Icons.notifications_active, onTap: (){},) ,
          CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
          CostomListTile(title: 'Languge' , icon: Icons.language,onTap: (){},) ,
          CostomListTile(title: 'Darrk Mode' , icon: Icons.brightness_3,onTap: (){},) ,
          CostomListTile(title: 'FeedBack' , icon: Icons.star,onTap: (){},) ,
          CostomListTile(title: 'Login' , icon: Icons.person,onTap: (){},) ,

        ],
      ),
    );
  }
}

