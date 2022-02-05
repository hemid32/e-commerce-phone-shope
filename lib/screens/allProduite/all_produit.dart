

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/constant.dart';

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


        BlocProvider<BlocLoading>(
          create: (BuildContext context) => BlocLoading(),
        ),


        //              BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;
      ],
      child: Scaffold(
        body: BlocListener<BlocLoading, bool>(

            listener: (context, state) {
              if(state==true){
                return showDialogloding(context) ;
              }else if(state == false){
                Navigator.pop(context) ;

              }


              // do stuff here based on BlocA's state
            },child: Body()),
        bottomNavigationBar: ButtomNavigatorBars(),


      ),
    );
  }
}

