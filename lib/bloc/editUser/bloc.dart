import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/editUser/event.dart';
import 'package:phoneshop/model/user/ServisecUser_Firebase.dart';

class BlocEditUser extends Bloc<EventEditProfile , dynamic>{
  BlocEditUser() : super(null);
  @override
  Stream mapEventToState(EventEditProfile event) async* {
    // TODO: implement mapEventToState
    //throw UnimplementedError();
    if(event.runtimeType == EventEditProfileGet){
      EventEditProfileGet _update = event ;
      UserFire userFire = UserFire(user: _update.newUser) ;
      var result = await  userFire.updateUser(_update.odlPassword, _update.oldEmeil) ;
      yield result ;
    }
  }

}