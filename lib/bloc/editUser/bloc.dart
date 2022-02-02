import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/editUser/event.dart';
import 'package:phoneshop/model/user/ServisecUser_Firebase.dart';

class BlocEditUser extends Bloc<EventEditProfile , dynamic>{
  BlocEditUser() : super(null){
    on<EventEditProfileGet>(_getEdit) ;
    on<EventEditProfileWithPhone>(_getEditWihPhon) ;
  }
  void _getEdit(EventEditProfileGet event , Emitter emit) async {
    UserFire userFire = UserFire(user: event.newUser) ;
    var result = await  userFire.updateUser(event.odlPassword, event.oldEmeil!, event.oldNombre) ;
    emit(result) ;

  }
  void _getEditWihPhon(EventEditProfileWithPhone event , Emitter emit) async {
    UserFire userFire = UserFire(user: event.newUser) ;
    var result = await  userFire.updateUseWithNewPhone(event.newUser , event.phonAuth) ;
    emit(result) ;

  }



}