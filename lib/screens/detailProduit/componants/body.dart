

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:phoneshop/bloc/addToCart/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
//import 'package:toast/toast.dart';

import 'body_details_widgets.dart';
import 'header_detail.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<BlocScreenDetailProduit , List<dynamic>>(
            builder: (context, state) {
              return HeaderDetail(image: state[0].image,);
            }
          ) ,
          BodyDetail(title: BlocProvider.of<BlocScreenDetailProduit>(context).state[0].detail , price:  500, priceOld:  600,),


        ],
      ),
    );

  }
}

