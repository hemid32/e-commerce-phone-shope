import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/loginorRegester/componants/icon_sotial.dart';
import 'package:phoneshop/screens/loginorRegester/widget/log_in.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register_form.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

import 'button_costom_login.dart';
import 'costom_path.dart';
import 'logo_text_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          RigesterOrLogin() ,
          //Login() ,
          //Register()

        ],
      ),
    );
  }
}

