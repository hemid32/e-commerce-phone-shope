import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/screens/homescreen/widgeets/favorite.dart';
import 'package:phoneshop/screens/homescreen/widgeets/home.dart';
import 'package:phoneshop/screens/homescreen/widgeets/setting_app.dart';
import 'package:phoneshop/screens/screen_pay/widgets/cart.dart';

import 'events.dart';


class CounterBloc extends Bloc<EventsHome, Widget> {
  /// {@macro counter_bloc}
  CounterBloc() : super(Home());

  @override
  Stream<Widget> mapEventToState(EventsHome event) async* {
    //print(event.runtimeType) ;
    switch (event.runtimeType) {
      case GoToFavorite:
        print('go to fav from event  ');
        yield Favorite();
        break;
      case GoToCart:
        yield Cart();
        break;
      case GoToHome:
        yield Home();
        break;
      case GoToSetting:
        yield SettingAPP();
        break;
        addError(Exception('unsupported event'));
    }
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
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