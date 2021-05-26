

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/validatorTaxtField/event.dart';
import 'package:phoneshop/screens/homescreen/widgeets/home.dart';

class ValidatorTexxtBlocString extends Bloc<EventsTextFeild, dynamic> {
  /// {@macro counter_bloc}
  ValidatorTexxtBlocString() : super(null);
  @override
  Stream<String> mapEventToState(EventsTextFeild event) async* {
    //print(event.runtimeType) ;
    if(event.runtimeType == TextFieldValidatorEventNome ){
      TextFieldValidatorEventNome valid =event ;
      //print(event) ;
      yield valid.validator() ;
    }

  }
}