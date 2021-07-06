

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/bloc/myOrder/bloc.dart';

import 'componants/body.dart';

class MyOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocMyOrder>(
          create: (BuildContext context) => BlocMyOrder(),
        ),
        BlocProvider<BlocDataOrderShow>(
          create: (BuildContext context) => BlocDataOrderShow(),
        ),
      ],
      child: Scaffold(
        body: Body(),
      ),
    );

  }
}
//BlocMyOrder