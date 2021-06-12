import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/event.dart';
import 'package:phoneshop/constant.dart';

import 'button_costom_login.dart';

class IconSotialAndButtons extends StatelessWidget {
  const IconSotialAndButtons({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      padding: EdgeInsets.only(bottom: 20 , top: (size.height * 0.5 )/ 4 ),
      width:  size.width,
      height: size.height *0.50,
      decoration: BoxDecoration(
          color: Colors.white
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonCotomLogIn(
            title: 'LOGIN',
            color: kPrimaryColor,
            onTap: ()=> BlocProvider.of<BlocScreenLoginRegisterManage>(context).add(EventScreenLogin()),
          ),
          SizedBox(height: 15,) ,
          ButtonCotomLogIn(
            title: 'REGISTER',
            color: Colors.red.withOpacity(0.8),
            onTap: ()=> BlocProvider.of<BlocScreenLoginRegisterManage>(context).add(EventScreenRegister()),
          ),

          Spacer() ,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/icons8-facebook.svg'),
              SizedBox(width: 20,) ,
              SvgPicture.asset('assets/icons/icons8-google-plus.svg'),
              SizedBox(width: 20,) ,
              SvgPicture.asset('assets/icons/icons8-twitter-circled.svg'),

            ],
          )
        ],
      ),
    );
  }
}

