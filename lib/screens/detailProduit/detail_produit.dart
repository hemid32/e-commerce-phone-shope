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

    final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();


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
              /*
              Toast.show("Added to favorites",
                  context,
                  duration: Toast.LENGTH_LONG,
                  gravity:  Toast.TOP ,
                backgroundColor:  kPrimaryColor ,
                border: Border.all(color: Colors.white) ,
              );

               */
              ScaffoldMessenger.of(_scaffoldkey.currentContext).showSnackBar(SnackBar(content: Text('Added to cart', style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.white),) , backgroundColor: kPrimaryColor.withOpacity(0.6),));
            }else {
              ScaffoldMessenger.of(_scaffoldkey.currentContext).showSnackBar(SnackBar(content: Text('The item is in the cart !! ', style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.white),) , backgroundColor: Colors.red.withOpacity(0.6),));

            }
          },
          child: Scaffold(
            key: _scaffoldkey,
            backgroundColor: Theme.of(context).accentColor,
            body: Body(),
            bottomNavigationBar: ButtomNavigatorBar(),
          ),
        ));
  }
}
