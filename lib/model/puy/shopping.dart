

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/produit/servises.dart';

class ShoppingModelMethod {

  final String titleMethod ;
  final double price ;
  final List<String> wilayaSupport  ;

  ShoppingModelMethod({this.titleMethod, this.price, this.wilayaSupport});

  factory ShoppingModelMethod.fromJson(Map<String , dynamic> jsnData){
    return ShoppingModelMethod(
      titleMethod : jsnData['titleMethod'],
      price : jsnData['price'],
      wilayaSupport : jsnData['wilayaSupport'],
    ) ;
  }


  Map<String , dynamic> toMap(){
    return {
      'titleMethod' : titleMethod ,
      'price' : price ,
      'wilayaSupport' : wilayaSupport ,
    };
  }


}


class TotalShoppingMethod {
  final  List<ShoppingModelMethod> methods ;
  TotalShoppingMethod({this.methods});
  factory TotalShoppingMethod.fromJson(Map<String , List<ShoppingModelMethod> > jsnData){
    return TotalShoppingMethod(
        methods : jsnData['methods']
    ) ;
  }
}



// exemple
Map<String ,List<ShoppingModelMethod> >  t = {
  'methods': [
    ShoppingModelMethod.fromJson({
      'titleMethod' : 'yaliden' ,
      'price' : 200.0 ,
      'wilayaSupport' : ['Tiaret' , 'Djelfa' , 'Sidi Bel Abbes']

    } ),
    ShoppingModelMethod.fromJson({
      'titleMethod' : 'frihali' ,
      'price' : 500.0 ,
      'wilayaSupport' : ['Bejaia' , 'Annaba']

    } ),
    ShoppingModelMethod.fromJson({
      'titleMethod' : 'bahri' ,
      'price' : 800.0 ,
      'wilayaSupport' : ['Ouargla' , 'El Bayadh']
    } ),

  ]
};

 List testMetod(){
  TotalShoppingMethod  listMethodTest = TotalShoppingMethod.fromJson(t) ;
  //print('metods == ${listMethodTest.methods}') ;
  return listMethodTest.methods ;
}

// test save method shopping from firebase  deleted *


saveMethodsShoppingFromFireBase(){
  try{
    CollectionReference _method = FirebaseFirestore.instance.collection(
        'MethodsShopping');
    List<ShoppingModelMethod> mapData = t['methods'] ;
    // print('mapData === $mapData') ;
    mapData.forEach((element) async  {
      await _method.add(element.toMap()) ;
    });

    return true ;
  }catch(e){
    print('errur saveMethodsShoppingFromFireBase ===========*==*==*===*====*==============================================  $e}') ;
    return e ;
  }
}
