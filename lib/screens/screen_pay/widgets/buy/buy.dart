import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/screens/homescreen/homescreen.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/accept_and_shopping.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/conferm_arreved.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/sand_domand.dart';

class DetailOrderaFterBuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Column(
        children: [
          BlocBuilder<BlocDataOrderShow, dynamic>(builder: (context, state) {
            //return
            if (state[4] == 0) {
              return SandDomand();
            } else if (state[4] == 1) {
              return AcceptAndChopping();
            } else {
              return ConfermArrived();
            }
          }),
        ],
      ),
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(type: PageTransitionType.rightToLeft, child: HomeScreen()),
            (Route<dynamic> route) => false);
        return false;
      },
    );
  }
}
