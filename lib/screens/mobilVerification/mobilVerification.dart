import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';

import 'componants/body.dart';

class MobilVarification extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDataConfermUserCreatedCodSms>(create: (BuildContext context) => BlocDataConfermUserCreatedCodSms())
      ],
      child: Scaffold(
        body: Body(),
      ),
    );

  }
}
