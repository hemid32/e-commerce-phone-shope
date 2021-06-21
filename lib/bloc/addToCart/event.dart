







import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/produit/produit.dart';

class EventsAddToCartNew{}


class EventAddNewProduitToCart extends EventsAddToCartNew {
  final int contitu ;
  final Produit produit ;
  EventAddNewProduitToCart({this.contitu, this.produit});
  addToHive() async {
    bool isProduitFromCart = await validerItemProduitIsFromCart(produit.id, contitu) ;
    print('isProduitFromCart ====$isProduitFromCart');
    if (! isProduitFromCart ) {
      Map<String, dynamic> model = {
        'produit': produit.toMap(),
        'contituPay': contitu,
      };
      bool resut = await savModelCart(model);
      return resut;
    } else {
      return false ;
    }
  }
}