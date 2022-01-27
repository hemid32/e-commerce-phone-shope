
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/languge/state.dart';
import 'package:phoneshop/oitil/storeageManage/storageManage.dart';

class BlocLanguage extends Cubit<StateBlocLanguage>{
  BlocLanguage():super(StateBlocLanguageInitState()) ;

  static BlocLanguage get(context) => BlocProvider.of(context) ;

  Locale locale = Locale('en' , "") ;


  intialValue()async {
    //print('init stat') ;
    var language = await  StorageManager.readData('language') ;
    if(language != null){
      locale = Locale(language , "") ;
      emit(StateBlocLanguageInitState()) ;
    }
  }

  changeLocal(String newLocal)  {
    StorageManager.saveData('language', newLocal) ;
    locale = Locale(newLocal , "") ;
    emit(StateBlocLanguageChangeLanguage()) ;
  }


}