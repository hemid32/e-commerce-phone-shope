

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/screenLoginRegister/event.dart';
import 'package:phoneshop/screens/loginorRegester/widget/log_in.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register.dart';
import 'package:phoneshop/screens/loginorRegester/widget/register_form.dart';

class BlocScreenLoginRegisterManage extends Bloc<EventScreenLoginRegisterManage , Widget>{
  BlocScreenLoginRegisterManage() : super(RigesterOrLogin());

  @override
  Stream<Widget> mapEventToState(EventScreenLoginRegisterManage event)  async*{
    // TODO: implement mapEventToState
    if(event.runtimeType == EventScreenLogin ){
      yield Login() ;
    }else if(event.runtimeType == EventScreenRegister){
      yield Register() ;
    }else {
      yield RigesterOrLogin() ;
    }

  }

}