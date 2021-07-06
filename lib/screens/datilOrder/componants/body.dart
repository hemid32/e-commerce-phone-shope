import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/accept_and_shopping.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/conferm_arreved.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/sand_domand.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            height: 100 ,
            decoration: BoxDecoration(
                color: kPrimaryColor
            ),
            child: Row(
              children: [
                GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                    child: Icon(Icons.arrow_back , color: Colors.white ,size: 30,)) ,
                Expanded(
                  child: Center(
                    child: Text('My Order' , style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white ,
                        fontSize: 25
                    ),),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<BlocDataOrderShow , dynamic>(builder: (context , state){
            //return
            if(state[4] == 0){
              return SandDomand()   ;
            }else if(state[4] == 1){
              return AcceptAndChopping()   ;
            }else {
              return ConfermArrived() ;
            }
          }),

        ],
      ),
    );

  }
}
