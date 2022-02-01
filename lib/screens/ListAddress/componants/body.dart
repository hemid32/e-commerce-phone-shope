import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageAddress/bloc.dart';
import 'package:phoneshop/bloc/manageAddress/state.dart';

import 'card_adress.dart';

class Body extends StatelessWidget {
  const Body({Key?  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocManageAddress.get(context).getAllAdress() ;

    Size size = MediaQuery.of(context).size ; 
    return SingleChildScrollView(
      child: BlocConsumer<BlocManageAddress , StateManageAddress>(
        listener: (context , state){

        },
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(height: 20,) ,
              for(var adress in BlocManageAddress.get(context).listAdderss )
                CardAdress(
                    adress: adress ,
                    onDelet: (){
                      BlocManageAddress.get(context).deletAddress(adress.id) ;
                    },
                     onTap: (){} ,
                )

            ],
          );
        }
      ),

    );
  }
}

