


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/bloc.dart';
import 'package:phoneshop/bloc/getMessageq/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';

import 'componants/body.dart';
import 'componants/buttomNavigationBar.dart';
import 'componants/costom_listTile.dart';
import 'componants/drawer.dart';

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
        /*
        BlocProvider<BlocFavoriteIs>(
          create: (BuildContext context) => BlocFavoriteIs(),
        ),
        BlocProvider<BlocFavoriteList>(
                  create: (BuildContext context) => BlocFavoriteList(),
                ),

         */
        BlocProvider<BlocUserVerifaid>(
                  create: (BuildContext context) => BlocUserVerifaid(),
                ),
        /*
        BlocProvider<BlocMassegersGet>(
                  create: (BuildContext context) => BlocMassegersGet(),
                ),

         */
      ],
      child: Scaffold(
        body:   WillPopScope(child: Body() ,

        onWillPop: () async {
          _showMyDialogCloseApp(context) ;
          return false ;
        },
        ),
        //Body(),
        drawer: DrawerApps(),
        bottomNavigationBar: BottomNavigationsBars()
        ),
      //BottomNavigationsBars(),
    );
  }

}

Future<void> _showMyDialogCloseApp(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Close App'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              //Text('This is a demo alert dialog.'),
              Text('Do you want to exit the application?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              //Navigator.of(context).pop();
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');

            },
          ),
        ],
      );
    },
  );
}
