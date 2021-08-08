import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register.dart';

import 'header_verification.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          //RigesterOrLogin() ,
          //Login() ,
          //Register()

          BlocBuilder<BlocScreenLoginRegisterManage ,  Widget>(
              builder: (context ,  stats){
            return stats ;
          })




        ],
      ),
    );
  }
}

