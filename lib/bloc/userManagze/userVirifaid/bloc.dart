
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/event.dart';

class BlocUserVerifaid extends Bloc<EventUserVerifaid  ,  bool>{
  BlocUserVerifaid() : super(false);

  @override
  Stream<bool> mapEventToState(EventUserVerifaid event) async* {
    // TODO: implement mapEventToState
    final _user = FirebaseAuth.instance.currentUser ;
    if(_user == null){
      yield false ;
    }else {
      yield true ;
    }

  }
}