







import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/produit/produit.dart';

class EventsAddToCartNew{}


class EventAddNewProduitToCart extends EventsAddToCartNew {
  final int contitu ;
  final Produit produit ;
  final String idProduitColors ;
  EventAddNewProduitToCart({this.contitu, this.produit , this.idProduitColors});
  addToHive() async {
    bool isProduitFromCart = await validerItemProduitIsFromCart(idProduitColors,produit.id, contitu) ;
    //print('isProduitFromCart ====$isProduitFromCart');
    if (! isProduitFromCart ) {
      Map<String, dynamic> model = {
        'produit': produit.toMap(),
        'contituPay': contitu,
        'idProduitColors' : idProduitColors ,
      };
      bool resut = await savModelCart(model);
      return resut;
    } else {
      return false ;
    }
  }
}