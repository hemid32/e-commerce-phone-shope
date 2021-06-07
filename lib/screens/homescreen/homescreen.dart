


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';

import 'componants/body.dart';
import 'componants/buttomNavigationBar.dart';

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

      ],
      child: Scaffold(
        body:   Body(),
        //Body(),
        bottomNavigationBar: BottomNavigationsBars()
        ),
      //BottomNavigationsBars(),
    );
  }
}

