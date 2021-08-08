import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/editUser/bloc.dart';
import 'package:phoneshop/bloc/user/bloc.dart';
import 'package:phoneshop/bloc/user/events.dart';

import 'componants/body.dart';

class EditProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocEditUser>(create: (BuildContext context)=> BlocEditUser()) ,
      ],
      child: WillPopScope(
        child: Scaffold(
          body: Body(),
        ),
        onWillPop: ()async{
          BlocProvider.of<BlocUserGetModel>(context).add(EventUserGet()) ;
          return true ;
        },
      ),
    );
  }
}
