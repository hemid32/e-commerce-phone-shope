/*
import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/favorite/model.dart';
import 'package:phoneshop/model/getModelFirebase/getTotalProduitColors.dart';
import 'package:phoneshop/model/hiveModel/favorite.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/model/produit/servises.dart';

class EvsentListFavorite{

}



class EventListItemsFavoriteShowList extends EvsentListFavorite {
  GetProduitTotalFromFirebas _dataProduitColors = GetProduitTotalFromFirebas() ;
  ListProduitsColors  _listProduits ; // = getProduitColors() ;
  List<ProduitsColors>  _listProduitsFavorite =  [];

  listProduitFavorite() async  {
    _listProduits =  await _dataProduitColors.getListProduitsColorsObject() ;
    ServisesFavoriteHive  _service = new  ServisesFavoriteHive(id: null) ;
    List<String> _itemFavoriteId = await _service.getItemFavorite() ;


    print('List<String> _itemFavoriteId ======= $_itemFavoriteId') ;

    _listProduits.produits.forEach((element) {
      print('element.id ===== ${element.id}') ;
      if(_itemFavoriteId.contains(element.id)){
        print('is item fav ===== ${element.id}') ;
        _listProduitsFavorite.add(element) ;
      }
    });

    ListProduitsColors  _listPro = ListProduitsColors.fronJson(
        {

          'produits' : _listProduitsFavorite
        }
    ) ;
    return _listPro ;

  }


}


class EventListItemsFavoriteDeleteItems extends EvsentListFavorite {


  final  ProduitsColors produit ;
  EventListItemsFavoriteDeleteItems({@required this.produit});

  listProduitFavoriteAfterDeleted() async  {
    ServisesFavoriteHive _delet = new  ServisesFavoriteHive(id: produit.id) ;
    await _delet.deletItemFavorite() ;
    EventListItemsFavoriteShowList _listProduitFavorite = EventListItemsFavoriteShowList() ;
    ListProduitsColors _result = await _listProduitFavorite.listProduitFavorite() ;
    return _result ;
  }


}

 */
