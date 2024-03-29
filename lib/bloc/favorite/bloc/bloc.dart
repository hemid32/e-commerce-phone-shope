import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc/state.dart';
import 'package:phoneshop/model/favorite/model.dart';
import 'package:phoneshop/model/favorite/servises.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class BlocFavorite extends Cubit<StateFavorite>{
  BlocFavorite(
      ) : super(StateFavoriteInitState());

  static BlocFavorite get(context) => BlocProvider.of(context) ;


  List<ModelFaveriote> listFav = [] ;
  List<String> listIdProduitColor = [] ;
  List<String> listIdProduit = [] ;

  intiStateData() async {
    listFav = await ServisesFavoriteHive.getItemFavorite() ;
    lsiIdFav() ;
    emit(StateFavoriteInitState()) ;
  }

  lsiIdFav(){
    listIdProduitColor.clear();
    listIdProduit.clear();
    listFav.forEach((element) {
      listIdProduit.add(
        element.idProduit
      ) ;
      listIdProduitColor.add(
        element.produitColors.id!
      );
    });

  }

  whenClickFavIcon(ProduitsColors produitsColors , String idProduit ) async  {
    ModelFaveriote modelFaveriote = ModelFaveriote(produitColors: produitsColors , idProduit: idProduit) ;
    ServisesFavoriteHive servisesFavoriteHive = ServisesFavoriteHive(favoriteModel: modelFaveriote) ;
    await servisesFavoriteHive.addItemFavorite() ;
    await intiStateData() ;
    emit(StateFavoriteClickFav()) ;
  }


  deletFav(ModelFaveriote modelFaveriote) async {
    ServisesFavoriteHive servisesFavoriteHive = ServisesFavoriteHive(favoriteModel: modelFaveriote) ;
    await servisesFavoriteHive.deletItemFavorite() ;
    await intiStateData() ;
    emit(StateFavoriteDeletFav()) ;


  }

}

