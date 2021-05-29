


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

