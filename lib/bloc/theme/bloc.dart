import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/theme/event.dart';

class BlocTheme extends Bloc<EventThemeMode , List>{
  BlocTheme({  ThemeData? initialState}) : super([initialState]);

  @override
  Stream<List> mapEventToState(EventThemeMode event) async* {
    // TODO: implement mapEventToState

    if(event is  EventsChangeThemeMode){
      EventsChangeThemeMode  theme  = event ;
      yield [await theme.changeMode()] ;
    }
    if(event is  EventsThemeChangedInitilis){

      EventsThemeChangedInitilis themeIntial = event ;
      yield [await themeIntial.getTheme()] ;
    }

  }
}