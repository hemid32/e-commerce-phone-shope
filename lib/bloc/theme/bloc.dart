import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/theme/event.dart';

class BlocTheme extends Bloc<EventThemeMode , List>{
  BlocTheme({  ThemeData? initialState}) : super([initialState])  {
    on<EventsChangeThemeMode>(_changeMode) ;
    on<EventsThemeChangedInitilis>(_initState) ;
  }
  
  
  void _changeMode(EventsChangeThemeMode event , Emitter<List>emit) async  {
    ThemeMode _listTheme = await event.changeMode() ;
    emit([_listTheme]) ;
    //return [listTheme] ;
  }
  void _initState(EventsThemeChangedInitilis event , Emitter<List>emit) async  {
    ThemeMode  _listTheme = await event.getTheme() ;
    emit([_listTheme]) ;
    //return [listTheme] ;
  }

}