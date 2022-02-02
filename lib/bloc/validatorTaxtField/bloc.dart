

//import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
//import 'package:phoneshop/screens/homescreen/widgeets/home.dart';

class ValidatorTexxtBlocString extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocString() : super(null){
    on((event, emit) {
      if(event is TextFieldValidatorEventNome )
       emit( event.validator().trim()) ;
    });
  }

}

class ValidatorTexxtBlocPhoneNombre extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocPhoneNombre() : super(null){
    on((event, emit) {
      if(event is TextFieldValidatorEventPhoneNombre )
        emit( event.validator().trim()) ;
    });
  }

}

class ValidatorTexxtBlocPhoneEmail extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocPhoneEmail() : super(null){
    on((event, emit) {
      if(event is TextFieldValidatorEventPhoneEmail )
        emit( event.validator().trim()) ;
    });
  }

}


class ValidatorTexxtBlocPassword  extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocPassword() : super(null){
    on((event, emit) {
      if(event is TextFieldValidatorEventPassword )
        emit( event.validator().trim()) ;
    });
  }

}