import 'package:hive/hive.dart';
import 'package:phoneshop/model/puy/address.dart';
part 'addres.g.dart';

@HiveType(typeId: 3)
class AssressHive {
  // id produit color
  AssressHive({ this.address});
  @HiveField(0)
  Map<String, dynamic> address ;
}



class ServisesAdressHive {

  final ModelAdress address ;

  ServisesAdressHive({this.address});

  Future< List<ModelAdress>> getAddress() async  {
    var box = await Hive.openBox('AddressHive');
    var result = box.values.toList();
    List<ModelAdress> addrs =[] ;
    result.forEach((element) {
      addrs.add(ModelAdress.fromJson(element.address)) ;
    }) ;
    //print('address saved ====== ${result}') ;
    return addrs ;


  }
  saveNewAddress()async  {
    try{
      var box = await Hive.openBox('AddressHive');
      AssressHive addresHive = AssressHive()
        ..address = address.toMap();
      box.put( address.id,addresHive);
      return true ;
    }catch(e){
      return e ;
    }
  }

  static deletAddress(String id)async  {
    try{
      var box = await Hive.openBox('AddressHive');
      box.delete(id) ;
      return true ;
    }catch(e){
      return e ;
    }
  }

}