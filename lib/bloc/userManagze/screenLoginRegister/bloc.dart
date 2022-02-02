


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/event.dart';
import 'package:phoneshop/screens/loginorRegester/widget/log_in.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register_form.dart';

class BlocScreenLoginRegisterManage extends Bloc<EventScreenLoginRegisterManage , Widget>{
  BlocScreenLoginRegisterManage() : super(RigesterOrLogin()){
    on((event, emit) {
      if(event.runtimeType == EventScreenLogin ){
        emit( Login() );
      }else if(event.runtimeType == EventScreenRegister){
        emit( Register() );
      }else {
        emit( RigesterOrLogin() );
      }
    });
  }



}