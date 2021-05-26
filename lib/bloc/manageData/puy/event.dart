import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';

abstract class EventsPuyData{

}

class AddAdressData extends EventsPuyData {

  final  ModelAdress adress ;

  AddAdressData(this.adress);


}
class AddShoppingData extends EventsPuyData {

  final MethodShoppingShoi methodShopping ;

  AddShoppingData(this.methodShopping);

}
