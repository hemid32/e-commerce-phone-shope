
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/events.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/register/bloc.dart';
import 'package:phoneshop/bloc/userManagze/formerRegister/termAndCondition/bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/event.dart';
import 'package:phoneshop/bloc/validatorTaxtField/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/widgeets/home.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register_form.dart';
import 'package:phoneshop/screens/profile/profile.dart';
import 'package:toast/toast.dart';

import 'componants/body.dart';

class LoginOrRegester extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocScreenLoginRegisterManage>(
          create: (BuildContext context) => BlocScreenLoginRegisterManage(),
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
        BlocProvider<ValidatorTexxtBlocPassword>(
          create: (BuildContext context) => ValidatorTexxtBlocPassword(),
        ),
        BlocProvider<BlocTermaAndConditionChek>(
          create: (BuildContext context) => BlocTermaAndConditionChek(),
        ),
        BlocProvider<BlocRegisterUser>(
          create: (BuildContext context) => BlocRegisterUser(),
        ),
        BlocProvider<BlocLoading>(
          create: (BuildContext context) => BlocLoading(),
        ),

        BlocProvider<BlocScreenManageVerificationCodSms>(
          create: (BuildContext context) => BlocScreenManageVerificationCodSms(),
        ),
        /*
        BlocProvider<BlocDataConfermUserCreatedCodSms>(
          create: (BuildContext context) => BlocDataConfermUserCreatedCodSms(),
        ),

         */
      ],
      child: Scaffold(
        body: Body(),
      ),
    );

  }


}
