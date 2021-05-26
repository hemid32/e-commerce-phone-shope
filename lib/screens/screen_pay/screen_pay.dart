
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';

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
        ],
      child:  Scaffold(
          body: Body(),

    ) ) ;

  }
}
