
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/user/bloc.dart';
import 'package:phoneshop/bloc/user/events.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/user/user.dart';

import 'componants/body.dart';

class Profile extends StatelessWidget {
  GetUserFireBase _userGetter = GetUserFireBase() ;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserLocalModel>(
      future: _userGetter.getUser() ,
      builder: (context, snapshot) {
        return snapshot.hasData ? MultiBlocProvider(
          providers: [
            BlocProvider<BlocUserGetModel>(create: (BuildContext context)=> BlocUserGetModel(initialState: snapshot.data)) ,
          ],
          child: Scaffold(
            body: Body(),
          ),
        ): Scaffold(body: Center(child: CircularProgressIndicator(),),);
      }
    );

  }
}
