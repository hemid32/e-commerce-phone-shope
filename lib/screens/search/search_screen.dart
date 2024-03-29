
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/search/bloc.dart';

import 'componants/body.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<BlocEventSearch>(
        create: (BuildContext context) => BlocEventSearch(),) ,
        BlocProvider<BlocScreenDetailProduit>(
        create: (BuildContext context) => BlocScreenDetailProduit(),
         ),
    ],
    child:  Scaffold(
          body: Body(),
        )

    );

  }
}
