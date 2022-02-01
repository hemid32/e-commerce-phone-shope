import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/bloc.dart';
import 'package:phoneshop/bloc/ropDowenWilayat/bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:phoneshop/constant.dart';

import 'componants/body.dart';

class FormAddNewAddress extends StatelessWidget {
  const FormAddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
        BlocProvider<BlocDropDowenWilayat>(
          create: (BuildContext context) => BlocDropDowenWilayat(),
        ),
      ],
      child: Scaffold(
        body: Body(),
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Add New Address' , style: TextStyle(fontSize: 22,),),
        ),
      ),
    );

  }
}
