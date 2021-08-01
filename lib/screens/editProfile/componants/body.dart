import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/editProfile/editProfile.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

import 'header.dart';
import 'image_user.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Column(
      children: [
        Header(
          back: ()=>Navigator.pop(context),
        ) ,

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
          alignment: Alignment.centerLeft,
          child: Text('Edit Profile' , style: Theme.of(context).textTheme.headline2,),
        ) ,

        ImageUser(
          imageCurrent: 'assets/images/user.png',
          onTap: (){},
        ),

        FieldTextGet(
          title: 'name',
        ) ,
        FieldTextGet(
          title: 'Email',
        ) ,
        FieldTextGet(
          title: 'Nombre Phone',
        ) ,
        FieldTextGet(
          title: 'Password',
        ) ,

        Spacer() ,

        DoubleButtonButtom(
          titleBunnGreen: 'Save',
          titleBunnWaith: 'Cancel',
          onTapGreen: (){},
          onTapWath: (){},
          iconBunnGreen: Icons.save,
          iconBunnWaith: Icons.cancel,
        ) ,
        //SizedBox(height: 20,)


      ],
    );
  }
}

