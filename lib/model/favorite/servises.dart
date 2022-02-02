

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:phoneshop/model/favorite/model.dart';
import 'package:phoneshop/model/hiveModel/favorite.dart';
//import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class ServisesFavoriteHive {

  final ModelFaveriote favoriteModel  ;

  ServisesFavoriteHive({required this.favoriteModel});


   addItemFavorite() async  {
     if(! await chekIOtemIsExsit()) {
       var box = await Hive.openBox('FavoriteHive');
       //List<String> oldList = await getItemFavorite() ; //
       FavoriteHiveNewModel item = FavoriteHiveNewModel()
         ..favoretModelMap = favoriteModel.toMap();
       String keyHive = favoriteModel.produitColors.id! + favoriteModel.idProduit;
       box.put(keyHive, item);
     }else{
       await deletItemFavorite() ;
     }

  }
   deletItemFavorite() async  {
    var box = await Hive.openBox('FavoriteHive') ;
    box.delete(favoriteModel.produitColors.id! + favoriteModel.idProduit) ;
  }



  static Future<List<ModelFaveriote>> getItemFavorite()async {
    var box2 = await Hive.openBox('FavoriteHive');
    List<ModelFaveriote> listFav = [] ;
    //box2.deleteFromDisk();
    for(var i in box2.values.toList()){
      //print('i ===== ${i}') ;
      listFav.add(ModelFaveriote(produitColors: ProduitsColors.fromJsonHive(Map<String, dynamic>.from(i.favoretModelMap['produitColors'])) , idProduit: i.favoretModelMap['idProduit']));
    }
    return listFav ;
  }


  chekIOtemIsExsit()async {
    var box2 = await Hive.openBox('FavoriteHive');
    for(var key in box2.keys.toList()){
      if(key == favoriteModel.produitColors.id! + favoriteModel.idProduit ){
        return true ;
      }
    }
    return false ;
  }

  static getProduitFromProduitIndex(ProduitsColors produitsColors , String idProduit ){
     for(var produit in produitsColors.listProduits! ){
       if (produit.id.toString() == idProduit)
         return produit ;
     }
  }

}
