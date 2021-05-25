

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/widgeets/card.dart';
import 'package:phoneshop/screens/homescreen/widgeets/favorite.dart';
import 'package:phoneshop/screens/homescreen/widgeets/home.dart';
import 'package:phoneshop/screens/homescreen/widgeets/setting_app.dart';

import 'costom_listTile.dart';
import 'costom_list_tile_switch.dart';
import 'header_setting.dart';

class Body extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return SingleChildScrollView(
      //Home()
      //Favorite()
      // CartHome()
      //  SettingAPP(
      child:   BlocBuilder<CounterBloc, Widget>(
        builder: (_, count) {
          print("from builder $count") ;
          return  count;
        },
      ),
      //Home()

    );
  }
}

