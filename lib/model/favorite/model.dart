
import 'package:phoneshop/model/hiveModel/favorite.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class FavoriteModelItem {
  final  ProduitsColors produit ;
  bool  fav ;

  FavoriteModelItem({this.produit ,  this.fav = false  });
  // virifaid item is favorite or non
    Future<bool> ifFavorite() async  {
    ServisesFavoriteHive  service = new  ServisesFavoriteHive(id: null) ;
    List<String> itemFavorite = await service.getItemFavorite() ;
    //print('List <id> == $itemFavorite') ;
    if(itemFavorite.contains(produit.id) ){
      fav = true ;
    }
    //print('fav ======$fav') ;
    return fav ;
  }

  // add list favorite new item
  Future<bool> onTapFav() async  {
    bool oldFav =  await   ifFavorite() ;
    ServisesFavoriteHive  serviceAdd = new  ServisesFavoriteHive(id: produit.id) ;
    if(oldFav){
      fav = false ;
      await serviceAdd.deletItemFavorite() ;
    }else {
      fav = true ;
      await serviceAdd.addItemFavorite() ;
    }
    return fav ;
  }

}