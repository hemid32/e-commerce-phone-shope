import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/addToCart/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:toast/toast.dart';

import 'componants/body.dart';
import 'componants/bottom_navigator.dart';

class DetailProduit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocMinusAddProduitFromDetail>(
            create: (BuildContext context) => BlocMinusAddProduitFromDetail(),
          ),
          BlocProvider<BlocAddToCartNewProduit>(
            create: (BuildContext context) => BlocAddToCartNewProduit(),

          ),
        ],
        child:BlocListener<BlocAddToCartNewProduit, dynamic>(
          listener: (context, state)  async  {
            // do stuff here based on BlocA's state
            if( await state == true  ){
              //print('states === $state')  ;
              Toast.show("Added to favorites",
                  context,
                  duration: Toast.LENGTH_LONG,
                  gravity:  Toast.TOP ,
                backgroundColor:  kPrimaryColor ,
                border: Border.all(color: Colors.white) ,
              );
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Body(),
            bottomNavigationBar: ButtomNavigatorBar(),
          ),
        ));
  }
}
