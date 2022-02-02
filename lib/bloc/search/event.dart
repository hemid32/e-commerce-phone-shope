
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/model/produit/servises.dart';

class EventSearch {}



class EventListSearch extends EventSearch {
  final String nmaePhone ;

  EventListSearch(this.nmaePhone);


  ListProduitsColors search()   {
    //ListProduitsColors _listTotal = getProduitColors() ;
    List<ProduitsColors> _newList  = [] ;
    /*
    _listTotal.produits?.forEach((element) {
      if(element.nomPhone!.contains(nmaePhone)) {
        _newList.add(element) ;
      }
    });

     */
    ListProduitsColors _resultFinal = ListProduitsColors.fronJson({
      'produits' : _newList ,
    }) ;
    print('result === ${_resultFinal.produits!.length}');
    return _resultFinal ;
  }

}