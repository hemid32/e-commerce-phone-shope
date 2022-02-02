







import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/servises.dart';
import 'package:uuid/uuid.dart';

class EventsAddToCartNew{}


class EventAddNewProduitToCart extends EventsAddToCartNew {
  final int? contitu ;
  final Produit? produit ;
  final String? idProduitColors ;
  EventAddNewProduitToCart({this.contitu, this.produit , this.idProduitColors});
  addToHive() async {
    bool isProduitFromCart = await validerItemProduitIsFromCart(idProduitColors!,produit!.id!, contitu!) ;
    bool isProduitDesponible = await validerItemProduitIsDesponibleContitu(idProduitColors!,produit!.id!, contitu!) ;
    //print('isProduitFromCart ====$isProduitFromCart');
    if (! isProduitFromCart && ! isProduitDesponible ) {
      Map<String, dynamic> model = {
        'produit': produit!.toMap(),
        'contituPay': contitu,
        'idProduitColors' : idProduitColors ,
         'id' : Uuid().v4()
      };
      bool resut = await savModelCart(model);
      return resut;
    } else {
      return false ;
    }
  }
}