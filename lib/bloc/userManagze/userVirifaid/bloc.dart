
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/event.dart';

class BlocUserVerifaid extends Bloc<EventUserVerifaid  ,  bool>{
  BlocUserVerifaid() : super(false){
    on<EventUserVerifaid>(_verifeUser) ;
  }
   void _verifeUser(EventUserVerifaid event , Emitter<bool> emit){
     final _user = FirebaseAuth.instance.currentUser ;
     if(_user == null){
       //yield false ;
       emit(false) ;
     }else {
       //yield true ;
       emit(true)  ;
     }
   }

}