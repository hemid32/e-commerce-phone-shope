import 'package:phoneshop/model/user/user.dart';

class EventEditProfile { }



class EventEditProfileGet extends EventEditProfile {
  final UserLocalModel newUser ;
  final String oldEmeil ;
  final String odlPassword ;

  EventEditProfileGet({this.newUser, this.oldEmeil, this.odlPassword});



}