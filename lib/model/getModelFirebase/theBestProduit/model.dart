import 'package:phoneshop/model/getModelFirebase/getTotalProduitColors.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class GetTheBestProduits {

  final GetProduitTotalFromFirebas _produit = new  GetProduitTotalFromFirebas();




  Future<ListProduitsColors> getRecentOffers()async{
    final ListProduitsColors _totalProduit = await _produit.getListProduitsColorsObject();
    return _totalProduit ;

  }

  Future<ListProduitsColors> getTheBestProduit() async {
    //List<Produit> _theBest = [];
    final ListProduitsColors _totalProduit = await _produit.getListProduitsColorsObject();
    List<int> listNombrePaysProduits = [];

    _totalProduit.produits.forEach((element) {
      listNombrePaysProduits.add(element.nombrePay);
    });

    List<int> listIndexBestProduit = getHigthValue(listNombrePaysProduits);

    List<ProduitsColors> result = [];

    listIndexBestProduit.forEach((element) {
      result.add(_totalProduit.produits[element]);
    });
    ListProduitsColors resultfilter =
        ListProduitsColors.fronJson({'produits': result});
    //print('resultfilter the best length === ${result.length}');
    return resultfilter;
  }



  getHigthValue(List<int> listNombrePaysProduits) {
    List<int> r = [];
    //final int _lenth = listNombrePaysProduits.length ;
    var i = 0;
    while (i < listNombrePaysProduits.length ) {
      //print('listNombrePaysProduits ===$listNombrePaysProduits') ;
      int max = listNombrePaysProduits.reduce((value, element) => value > element ? value : element);
      r.add(listNombrePaysProduits.indexOf(max));
      //listNombrePaysProduits.remove(max);
      listNombrePaysProduits[listNombrePaysProduits.indexOf(max)] = -1 ;
      i++;
    }
    //print('r======================$r') ;
    return r;
  }
}
