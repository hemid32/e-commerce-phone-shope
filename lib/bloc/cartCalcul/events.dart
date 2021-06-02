

import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/cart/cartCalcul.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';

abstract class EventsCalculCart{

}

class EventCart extends EventsCalculCart {
  final List<ModelCart>  listProduitCart  ;
  final MethodShoppingShoi  methodShopping ;
  EventCart({this.listProduitCart, this.methodShopping});
  ModelCartCalcul  calcule(){
    print('list produit cart == ${listProduitCart.length}');
    int contituTotalProduit = 0  ;
    double priceTotalProduits = 0   ;
    double priceShoppingTotal = 0  ;
    double priceTotal ;
    listProduitCart.forEach((element) {
      priceTotalProduits = ((element.produit.price  ) * element.contituPay ) + priceTotalProduits ;
    });
    listProduitCart.forEach((element) {
      contituTotalProduit = element.contituPay + contituTotalProduit ;
    });
    priceShoppingTotal   = contituTotalProduit * methodShopping.method.price ;
    priceTotal = priceTotalProduits + priceShoppingTotal ;
    /*
     total: json['total'] ,
      totalProduit:  json['totalProduit'] ,
      totalShopping: json['totalShopping']
     */
    ModelCartCalcul result = ModelCartCalcul.FromJson({
      'total' : priceTotal ,
      'totalProduit' : priceTotalProduits ,
      'totalShopping' : priceShoppingTotal ,

    });
    return result ;

  }



}
