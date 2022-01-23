import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/editUser/bloc.dart';
import 'package:phoneshop/bloc/editUser/event.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/bloc.dart';
import 'package:phoneshop/bloc/manageScreenConfermCodSms/event.dart';
import 'package:phoneshop/bloc/register/bloc.dart';
import 'package:phoneshop/bloc/user/bloc.dart';
import 'package:phoneshop/bloc/user/events.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/user/user.dart';
//import 'package:phoneshop/screens/editProfile/editProfile.dart';
import 'package:phoneshop/screens/mobilVerification/mobilVerification.dart';
import 'package:phoneshop/screens/screen_pay/componants/double_button_bottom.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

import 'header.dart';
import 'image_user.dart';

class Body extends StatelessWidget {


  UserLocalModel _user = UserLocalModel() ;

  String newName ;
  String newPassword ;
  String oldPassword ;
  String newPhone ;
  String newEmail ;
  String newImage ;

  @override
  Widget build(BuildContext context) {
    _user = BlocProvider.of<BlocUserGetModel>(context).state[0] ;
    newName = _user.name ;
    newEmail = _user.email ;
    newPhone = _user.nombrePhon  ;
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Header(
              back: (){
                BlocProvider.of<BlocUserGetModel>(context).add(EventUserGet()) ;
                Navigator.pop(context);
                },
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
              onChange: (text){
                //print(text) ;
                newName = text  ;
              },

            ) ,
            FieldTextGet(
              title: 'Email',
              initialValue: _user.email,
              onChange: (text){
                newEmail = text ;
              },

            ) ,
            FieldTextGet(
              title: 'Nombre Phone',
              initialValue: _user.nombrePhon,
              onChange: (text){
                newPhone = text ;
              },
            ) ,
            FieldTextGet(
              title: 'Current Passord',
              onChange: (text){
                oldPassword = text ;
              },
            ) ,
            FieldTextGet(
              title: 'New Password',
              onChange: (text){
                newPassword = text;
              },
            ) ,

            Spacer() ,

            BlocListener<BlocEditUser , dynamic>(
              listener: (context , stateListen){
                if(stateListen['state'] == true ) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Edited successfully', style: Theme
                          .of(context)
                          .textTheme
                          .button
                          .copyWith(fontSize: 15, color: Colors.white),),
                        backgroundColor: kPrimaryColor,));
                  //BlocProvider.of<BlocUserGetModel>(context).add(EventUserGet()) ;

                }else if(stateListen['state'] == false  && stateListen['target'] == 'change_phone'    ){
                  UserLocalModel _newUser = UserLocalModel(
                    name:  newName ,
                    password: newPassword ,
                    nombrePhon: newPhone ,
                    image: newImage ,
                    email:  newEmail ,

                  ) ;
                  BlocProvider.of<BlocScreenManageVerificationCodSms>(context).add(EventManageConfermCodSmsSandCod(user: _newUser , isUpdate: true )) ;

                  Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                    value: BlocProvider.of<BlocEditUser>(context),//BlocEditUser
                    child: BlocProvider.value(
                        value:  BlocProvider.of<BlocScreenManageVerificationCodSms>(context),
                        child: BlocProvider.value(
                            value: BlocProvider.of<BlocRegisterUser>(context),
                            child: MobilVarification())),
                  ))) ;

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${stateListen['message']}', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15 , color: Colors.white),) , backgroundColor: Colors.red,));
                }
              },
              child: DoubleButtonButtom(
                titleBunnGreen: 'Save',
                titleBunnWaith: 'Cancel',
                onTapGreen: (){

                  UserLocalModel newUser = UserLocalModel(
                    name:  newName ,
                    password: newPassword ,
                    nombrePhon: newPhone ,
                    image: newImage ,
                    email:  newEmail ,

                  ) ;
                  BlocProvider.of<BlocEditUser>(context).add(EventEditProfileGet(
                    oldNombre: _user.nombrePhon,
                    newUser: newUser ,
                    odlPassword: oldPassword ,
                    oldEmeil: _user.email ,
                  )) ;
                },
                onTapWath: (){
                  Navigator.pop(context) ;
                },
                iconBunnGreen: Icons.save,
                iconBunnWaith: Icons.cancel,
              ),
            ) ,
            //SizedBox(height: 20,)


          ],
        ),
      ),
    );
  }
}

