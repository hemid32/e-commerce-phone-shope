import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/puy_screen/events.dart';
import 'package:phoneshop/screens/screen_pay/widgets/adress.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/buy.dart';
import 'package:phoneshop/screens/screen_pay/widgets/buy/widgestStateRequst/sand_domand.dart';
import 'package:phoneshop/screens/screen_pay/widgets/cart.dart';
import 'package:phoneshop/screens/screen_pay/widgets/shopping.dart';

class PuyScreenBloc extends Bloc<EventsPuy, Widget> {
  /// {@macro counter_bloc}
  PuyScreenBloc() : super(Addres());

  @override
  Stream<Widget> mapEventToState(EventsPuy event) async* {
    //print(event.runtimeType) ;
    switch (event.runtimeType) {
      case FirstAddAdress:
        //print('go to fav from event  ');
        yield Addres();
        break;
      case ContinuShopping:
        yield Shopping();
        break;
      case ContenuVarifeid:
        yield Cart();
        break;
      case LastPuy:
        yield DetailOrderaFterBuy();
        break;
        addError(Exception('unsupported event'));
    }
  }
}
