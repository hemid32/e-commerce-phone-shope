import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/slideFilter/state.dart';

class BlocSlideFilter extends Cubit<StetSlideFilter>{
  BlocSlideFilter() : super(StetSlideFilterInitState());

  static BlocSlideFilter get(context) => BlocProvider.of(context) ;


  double ram = 16.0 ;
  double storage = 600.0  ;
  double camera =108.0 ;
  double price = 100000.0 ;


  changeRam(double newValue){
    ram = newValue ;
    emit(StetSlideFilterChangeRam()) ;
  }

  changeStorage(double newValue){
    storage = newValue ;
    emit(StetSlideFilterChangeStorage()) ;
  }

  changeCamera(double newValue){
    camera = newValue ;
    emit(StetSlideFilterChangeCamera()) ;
  }

  changePrice(double newValue){
    price = newValue ;
    emit(StetSlideFilterChangePrice()) ;
  }





}