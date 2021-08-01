import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';

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

