
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/widgets/adress.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/accept_and_shopping.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/conferm_arreved.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/sand_domand.dart';
import 'package:phoneshop/screens/screen_pay/widgets/cart.dart';
import 'package:phoneshop/screens/screen_pay/widgets/shopping.dart';


import 'container_buttom_prograss_shopping.dart';
import 'double_button_bottom.dart';
import 'header.dart';
import 'item_top_menu.dart';
import 'progress_shopping.dart';
import 'text_rich_buttom_deatils.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Header(),

          Items_Menuu() ,
          //Addres(),  // this is screen adrees
          //Shopping()   // this is widget shopping
          //Cart() , // this is widgzts cart


          // this is state buy
          //SandDomand() ** 1
          // AcceptAndChopping() ** 2
          //ConfermArrived()

          BlocBuilder<PuyScreenBloc , Widget>(builder: (_, widget){
            return widget ;
          })








          

        ],

      ),
    );
  }
}

