import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageData/puy/event.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';

class AdressDataBloc extends Bloc<AddAdressData, ModelAdress> {
  /// {@macro counter_bloc}
  AdressDataBloc()
      : super(ModelAdress(
            nome: 'nome',
            prenome: 'prenome',
            nomberPhone: 'nomberPhone',
            email: 'email',
            wilaya: 'wilaya',
            daira: 'daira',
            adress1: 'adress1',
            address2: 'address2',
            codPostal: 0000,
            id: 'id'));

  @override
  Stream<ModelAdress> mapEventToState(AddAdressData event) async* {
    //print(event.runtimeType) ;
    if (event.runtimeType == AddAdressData) {
      //save Data adress
      // return data event adress
      yield event.adress;
    }
  }
}

class ShoppingDataBloc extends Bloc<AddShoppingData, MethodShoppingShoi> {
  /// {@macro counter_bloc}
  ShoppingDataBloc() : super(MethodShoppingShoi());

  @override
  Stream<MethodShoppingShoi> mapEventToState(AddShoppingData event) async* {
    //print(event.runtimeType) ;
    if (event.runtimeType == AddShoppingData) {
      //save Data Shopping
      // return data event Shopping
      yield event.methodShopping;
    }
  }
}

/*
class ShoppingDataBloc extends Bloc<AddShoppingData, MethodShoppingShoi> {
  /// {@macro counter_bloc}
  ShoppingDataBloc() : super(MethodShoppingShoi());

  @override
  Stream<MethodShoppingShoi> mapEventToState(AddShoppingData event) async* {
    //print(event.runtimeType) ;
    if(event.runtimeType == AddShoppingData ){
      //save Data Shopping
      // return data event Shopping
      yield event.methodShopping ;
    }

  }
}

 */
