import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/timer/ticker.dart';
import 'package:phoneshop/bloc/timer/timer_bloc.dart';

import 'componants/body.dart';

class MobilVarification extends StatelessWidget {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDataConfermUserCreatedCodSms>(create: (BuildContext context) => BlocDataConfermUserCreatedCodSms()) ,
        BlocProvider<TimerBloc>(create: (BuildContext context) => TimerBloc(ticker: Ticker())) ,

      ],
      child: Scaffold(
        key: _scaffoldKey,
        body: Body(),
      ),
    );

  }
}
