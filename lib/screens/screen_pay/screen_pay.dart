
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/bloc.dart';
import 'package:phoneshop/bloc/cartScreenManage/bloc.dart';
import 'package:phoneshop/bloc/damand/bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/events.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/bloc/manageScreen/shoppingShoiMethods/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:toast/toast.dart';

import 'componants/body.dart';

class Buy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PuyScreenBloc>(
            create: (BuildContext context) => PuyScreenBloc(),
          ),
          BlocProvider<AdressDataBloc>(
            create: (BuildContext context) => AdressDataBloc(),
          ),
          BlocProvider<ValidatorTexxtBlocString>(
            create: (BuildContext context) => ValidatorTexxtBlocString(),
          ),
          BlocProvider<ValidatorTexxtBlocPhoneNombre>(
            create: (BuildContext context) => ValidatorTexxtBlocPhoneNombre(),
          ),
          BlocProvider<ValidatorTexxtBlocPhoneEmail>(
            create: (BuildContext context) => ValidatorTexxtBlocPhoneEmail(),
          ),
          BlocProvider<ShoppingBlocRadio>(
            create: (BuildContext context) => ShoppingBlocRadio(),
          ),
          //ShoppingDataBloc
          BlocProvider<ShoppingDataBloc>(
            create: (BuildContext context) => ShoppingDataBloc(),
          ),

          BlocProvider<CalculCartBloc>(
            create: (BuildContext context) => CalculCartBloc(),
          ),
          //BlocListDataCart
          BlocProvider<BlocListDataCart>(
            create: (BuildContext context) => BlocListDataCart(),
          ),
          BlocProvider<BlocSandDamand>(
            create: (BuildContext context) => BlocSandDamand(),
          ),
          BlocProvider<BlocLoading>(
            create: (BuildContext context) => BlocLoading(),
          ),
        ],
      child:  BlocListener<BlocSandDamand , dynamic >(
        listener: (context , state){
          if(state == true){
            BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;
            BlocProvider.of<PuyScreenBloc>(context).add(LastPuy());

          }else {
            BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;
            Toast.show( state.toString(),
              context,
              duration: 5,
              gravity:  Toast.BOTTOM ,
              border: Border.all(color: Colors.white) ,
            );
          }
        },
        child: Scaffold(
            body: Body(),

    ),
      ) ) ;

  }
}
