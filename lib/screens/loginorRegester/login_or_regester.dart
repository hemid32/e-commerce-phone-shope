
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/bloc.dart';
import 'package:phoneshop/bloc/laodingCirceler/events.dart';
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

      ],
      child: BlocListener<BlocRegisterUser, dynamic>(
        listener: (context, state)    {
          // do stuff here based on BlocA's state
            //print('states === $state')  ;
            if(state == true){
              //print('hemidibenameur') ;
              BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;
              Future.delayed(Duration(seconds: 1)) ;
              BlocProvider.of<BlocUserVerifaid>(context).add(EventsUserVerified());
              Navigator.pop(context) ;
              Navigator.pop(context) ;
              Toast.show( 'Account successfully created',
                context,
                duration: Toast.LENGTH_LONG,
                gravity:  Toast.BOTTOM ,
                backgroundColor:  kPrimaryColor ,
                border: Border.all(color: Colors.white) ,
              );

              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile()));


            }else{
              BlocProvider.of<BlocLoading>(context).add(EventLoadingStop()) ;
              Future.delayed(Duration(seconds: 1)) ;
              Toast.show( state.toString(),
                context,
                duration: Toast.LENGTH_LONG,
                gravity:  Toast.BOTTOM ,
                backgroundColor:  kPrimaryColor ,
                border: Border.all(color: Colors.white) ,
              );
            }
        },
        child: Scaffold(
          body: Body(),
        ),
      ),
    );

  }


}
