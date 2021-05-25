import 'package:phoneshop/model/puy/address.dart';

abstract class EventsPuyData{

}

class GetAdressData extends EventsPuyData {}
class AddAdressData extends EventsPuyData {

  final  ModelAdress adress ;

  AddAdressData(this.adress);


}
class AddShoppingData extends EventsPuyData {}
