import 'package:flutter/material.dart';
import 'package:phoneshop/bloc/fatchAllData/bloc.dart';
import 'header.dart';
import 'itemsGredViews.dart';
import 'text_and_logo.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(title: 'Best Salling', logo: BlocFatchData.get(context).logo,),

          //TextAndLogo(title: 'Best Salling', logo: 'assets/icons/icons8-apple-logo.svg',) , // anilation
          ItemsGredViews()
        ],
      ),
    );
  }
}


