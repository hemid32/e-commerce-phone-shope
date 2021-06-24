


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';

import 'componants/body.dart';
import 'componants/buttomNavigationBar.dart';
import 'componants/costom_listTile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<BlocHomeButtomBar>(
          create: (BuildContext context) => BlocHomeButtomBar(),
        ),
        BlocProvider<BlocScreenDetailProduit>(
          create: (BuildContext context) => BlocScreenDetailProduit(),
        ),
        BlocProvider<BlocListDataCart>(
          create: (BuildContext context) => BlocListDataCart(),
        ),
        BlocProvider<BlocAllProduitFilter>(
          create: (BuildContext context) => BlocAllProduitFilter(),
        ),
        BlocProvider<BlocFavoriteIs>(
          create: (BuildContext context) => BlocFavoriteIs(),
        ),
        BlocProvider<BlocFavoriteList>(
                  create: (BuildContext context) => BlocFavoriteList(),
                ),
        BlocProvider<BlocUserVerifaid>(
                  create: (BuildContext context) => BlocUserVerifaid(),
                ),

      ],
      child: Scaffold(
        body:   Body(),
        //Body(),
        drawer: Drawer(child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40 , bottom: 10),
                child: SvgPicture.asset('assets/icons/icons8-apple-logo.svg'),
              ), 
              CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
              CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
              CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
              CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
              CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
              CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,

            ],
          ),
        ),
        ),
        bottomNavigationBar: BottomNavigationsBars()
        ),
      //BottomNavigationsBars(),
    );
  }
}

