import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/editUser/event.dart';
import 'package:phoneshop/model/user/ServisecUser_Firebase.dart';

class BlocEditUser extends Bloc<EventEditProfile , dynamic>{
  BlocEditUser() : super(null);
  @override
  Stream mapEventToState(EventEditProfile event) async* {
    // TODO: implement mapEventToState
    //throw UnimplementedError();
    if(event is  EventEditProfileGet){
      UserFire userFire = UserFire(user: event.newUser) ;
      var result = await  userFire.updateUser(event.odlPassword, event.oldEmeil!, event.oldNombre) ;
      yield result ;
    }
    if(event is EventEditProfileWithPhone){
      UserFire userFire = UserFire(user: event.newUser) ;
      var result = await  userFire.updateUseWithNewPhone(event.newUser , event.phonAuth) ;
      yield result ;
    }
    }

}