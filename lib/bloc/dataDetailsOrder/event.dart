import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/cart/cartCalcul.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';

class EventDataOrderShow {}



class EventDataOdererShoawData extends EventDataOrderShow {

  final  List<ModelCart> listMedelCart ;
  final ModelAdress address ;
  final ModelCartCalcul calulerBuy ;
  final MethodShoppingShoi methoShopping ;
  final String uidDomand ;
  final int state ;
  EventDataOdererShoawData({required this.listMedelCart,required this.address,
    required this.calulerBuy,
    required this.methoShopping,required this.state ,required this.uidDomand});




}