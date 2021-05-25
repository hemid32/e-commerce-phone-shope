import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/model/puy/address.dart';

class AdressDataBloc extends Bloc<AddAdressData, ModelAdress> {
  /// {@macro counter_bloc}
  AdressDataBloc() : super(ModelAdress());

  @override
  Stream<ModelAdress> mapEventToState(AddAdressData event) async* {
    //print(event.runtimeType) ;
    if(event.runtimeType == AddAdressData ){
      //save Data adress
      // return data event adress
      yield event.adress ;
    }

  }
}

class ShoppingDataBloc extends Bloc<ModelAdress, ModelAdress> {
  /// {@macro counter_bloc}
  ShoppingDataBloc() : super(ModelAdress());

  @override
  Stream<ModelAdress> mapEventToState(ModelAdress event) async* {
    //print(event.runtimeType) ;
    if(event.runtimeType == AddAdressData ){
      //save Data Shopping
      // return data event Shopping
      yield event ;
    }

  }
}
