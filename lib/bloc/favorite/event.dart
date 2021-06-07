import 'package:phoneshop/model/favorite/model.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class EventFavoriteBloc {}


class IsTapOnFavEvent extends EventFavoriteBloc {

  final  ProduitsColors produit ;

  IsTapOnFavEvent(this.produit  );


  Future<void>  isTap() async  {
      FavoriteModelItem _servises = new FavoriteModelItem(produit: produit);
       await _servises.onTapFav();
  }





}