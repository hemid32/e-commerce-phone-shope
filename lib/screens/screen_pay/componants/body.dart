
import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/widgets/cart.dart';


import 'header.dart';
import 'item_top_menu.dart';
import 'progress_shopping.dart';

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
          Column(
            children: [
              ProgressShopping() ,

            ],
          )





          

        ],

      ),
    );
  }
}

