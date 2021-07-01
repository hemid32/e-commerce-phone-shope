import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/myOrder/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/domand/model.dart';
import 'package:phoneshop/model/getModelFirebase/getMayOrder/my_order.dart';
import 'package:phoneshop/screens/myOrder/componants/header.dart';
import 'package:phoneshop/screens/myOrder/widgets/order_send_domand.dart';
import 'package:phoneshop/screens/myOrder/widgets/recoved_order.dart';
import 'package:phoneshop/screens/myOrder/widgets/shopping_order.dart';

import 'container_my_order.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderMyOrder(),
          SizedBox(height: 20,) ,
          /*
          OrderSendSomand(
            getOrder: _getOrder,
          ) ,
          
           */

           
          /*
          ReceivedOrder(
            getOrder: _getOrder,
          )

           */

          /*
          ShoppingOrder(
            getOrder: _getOrder,
          )

           */


          BlocBuilder<BlocMyOrder, Widget>(
              builder: (context, state) {
                return state ;
              }
          )


        ],
      ),
    );

  }
}

