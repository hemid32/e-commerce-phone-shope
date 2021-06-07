


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/event.dart';
import 'package:phoneshop/model/hiveModel/favorite.dart';

class BlocFavoriteIs extends Bloc<EventFavoriteBloc ,int> {
  BlocFavoriteIs() : super(500);

  @override
  Stream<int> mapEventToState(EventFavoriteBloc event) async* {
    // TODO: implement mapEventToState
    IsTapOnFavEvent _resultEvent = event  ;
    await _resultEvent.isTap() ;
    ServisesFavoriteHive  _service = new  ServisesFavoriteHive(id: null) ;
    List<int> itemFavorite = await _service.getItemFavorite() ;
    yield itemFavorite.length ;
  }
}