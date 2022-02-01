

//import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
//import 'package:phoneshop/screens/homescreen/widgeets/home.dart';

class ValidatorTexxtBlocString extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocString() : super(null);
  @override
  Stream<String> mapEventToState(EventsTextFeild event) async* {
    //print(event.runtimeType) ;
    if(event is  TextFieldValidatorEventNome ){
      TextFieldValidatorEventNome valid =event ;
      //print(event) ;
      yield valid.validator().trim() ;
    }
  }
}

class ValidatorTexxtBlocPhoneNombre extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocPhoneNombre() : super(null);
  @override
  Stream<String> mapEventToState(EventsTextFeild event) async* {
    //print(event.runtimeType) ;
    if(event is  TextFieldValidatorEventPhoneNombre ){
      TextFieldValidatorEventPhoneNombre valid =event ;
      //print(event) ;
      yield valid.validator().trim() ;
    }
  }
}

class ValidatorTexxtBlocPhoneEmail extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocPhoneEmail() : super(null);
  @override
  Stream<String> mapEventToState(EventsTextFeild event) async* {
    //print(event.runtimeType) ;
    if(event is  TextFieldValidatorEventPhoneEmail ){
      TextFieldValidatorEventPhoneEmail valid =event ;
      //print(event) ;
      yield valid.validator().trim() ;
    }
  }
}


class ValidatorTexxtBlocPassword  extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocPassword() : super(null);
  @override
  Stream<String> mapEventToState(EventsTextFeild event) async* {
    //print(event.runtimeType) ;
    if(event is  TextFieldValidatorEventPassword ){
      TextFieldValidatorEventPassword valid =event ;
      //print(event) ;
      yield valid.validator().trim() ;
    }
  }
}