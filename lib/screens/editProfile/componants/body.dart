import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/user/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
import 'package:phoneshop/screens/editProfile/editProfile.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

import 'header.dart';
import 'image_user.dart';

class Body extends StatelessWidget {


  UserLocalModel _user = UserLocalModel() ;

  @override
  Widget build(BuildContext context) {
    _user = BlocProvider.of<BlocUserGetModel>(context).state[0] ;
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Header(
              back: ()=>Navigator.pop(context),
            ) ,

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text('Edit Profile' , style: Theme.of(context).textTheme.headline2,),
            ) ,

            ImageUser(
              imageCurrent: 'assets/images/user.png',
              onTap: (){},
            ),

            FieldTextGet(
              title: 'name',
              initialValue: _user.name,

            ) ,
            FieldTextGet(
              title: 'Email',
              initialValue: _user.email,

            ) ,
            FieldTextGet(
              title: 'Nombre Phone',
              initialValue: _user.nombrePhon,
            ) ,
            FieldTextGet(
              title: 'Current Passord',
            ) ,
            FieldTextGet(
              title: 'New Password',
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
        ),
      ),
    );
  }
}

