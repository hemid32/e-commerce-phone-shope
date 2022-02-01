import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class EventFilterAllProduit {}


class EventsFilterAllProduitsevnts extends EventFilterAllProduit {

  final double? price ;
  final double? ram ;
  final double? storage ;
  final  double? camera ;
  final ListProduitsColors? produitsColors ;

  EventsFilterAllProduitsevnts({this.price = 500, this.ram = 2, this.storage = 0 , this.camera = 8 , this.produitsColors});

  ListProduitsColors filter(){
    List<ProduitsColors>  _listProduitNew = [] ;
    List<ProduitsColors>  _listOld = produitsColors!.produits! ;

    produitsColors!.produits?.forEach((element) {
      if(ram! >= element.listProduits![0].ram! && storage! >= element.listProduits![0].storage! && price! >= element.listProduits![0].price! && camera! >= element.listProduits![0].camera!  ) {
        _listProduitNew.add(element);


        //_listOld.remove(element);
      }
    });
    _listProduitNew.forEach((element) {
      _listOld.removeAt(_listOld.indexOf(element));
    });
    _listOld.forEach((element) {
      _listProduitNew.add(element) ;
    });
    ListProduitsColors _resulFilter = ListProduitsColors.fronJson({
      'produits' : _listProduitNew ,
    });


    return _resulFilter ;


  }






}