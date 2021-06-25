

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';

import 'componants/body.dart';
import 'componants/buttomNavigator.dart';

class AllProduit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocScreenDetailProduit>(
          create: (BuildContext context) => BlocScreenDetailProduit(),
        ),
        BlocProvider<BlocFavoriteList>(
          create: (BuildContext context) => BlocFavoriteList(),
        ),
        BlocProvider<BlocFavoriteIs>(
          create: (BuildContext context) => BlocFavoriteIs(),
        ),

      ],
      child: Scaffold(
        body: Body(),
        bottomNavigationBar: ButtomNavigatorBars(),


      ),
    );
  }
}

