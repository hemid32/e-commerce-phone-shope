import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/screens/homescreen/widgeets/card.dart';
import 'package:phoneshop/screens/homescreen/widgeets/favorite.dart';
import 'package:phoneshop/screens/homescreen/widgeets/home.dart';
import 'package:phoneshop/screens/homescreen/widgeets/setting_app.dart';
import 'package:phoneshop/screens/screen_pay/widgets/cart.dart';

import 'events.dart';


class BlocHomeButtomBar extends Bloc<EventsHome, Widget> {
  /// {@macro counter_bloc}
  BlocHomeButtomBar() : super(Home()){
    on((event,Emitter<Widget> emit) {
      switch (event.runtimeType) {
        case GoToFavorite:
        //print('go to fav from event  ');
          emit(Favorite()) ;
          break;
        case GoToCart:
          emit(CartHome()) ;
          break;
        case GoToHome:
          emit( Home()) ;
          break;
        case GoToSetting:
          emit(SettingAPP()) ;
          break;
          addError(Exception('unsupported event'));
      }
    });
  }


}


class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}