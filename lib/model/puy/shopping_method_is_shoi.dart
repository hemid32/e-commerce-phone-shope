

import 'package:phoneshop/model/puy/shopping.dart';

class MethodShoppingShoi {

  final ShoppingModelMethod? method ;
  final  bool fin ;

  MethodShoppingShoi({this.method, this.fin = false});

  factory MethodShoppingShoi.froJson(
      Map<String , dynamic> jsnData
       ){
    return MethodShoppingShoi(
        method : jsnData['method'] ,
        fin: jsnData['fin']
    );

  }


  Map<String , dynamic> toMap(){
    return {
      'method' : method!.toMap() ,
      'fin' : fin  ,
    } ;
  }


}