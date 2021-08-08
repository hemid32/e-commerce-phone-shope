import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/loginorRegester/componants/header_verification.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/conferme.dart';
import 'package:phoneshop/screens/mobilVerification/widgets/sand_sms.dart';

import 'button.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          //SandSms(),
          //ConfermSms()

          BlocBuilder<BlocScreenManageVerificationCodSms , Widget>(builder: (context , state){
            return state ;
          })

        ],
      ),
    );

  }
}

