


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';

import 'componants/body.dart';
import 'componants/buttomNavigationBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc(),
      child: Scaffold(
        body:   Body(),
        //Body(),
        bottomNavigationBar: BottomNavigationsBars()
        ),
      //BottomNavigationsBars(),
    );
  }
}

