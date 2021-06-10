



import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';
import 'package:phoneshop/model/user/user.dart';

class DomandProduit {
  final  int nombreDomand  ;
  final ListModelCarte listProduitBuy ;
  final ModelAdress addres ;
  final MethodShoppingShoi methodSopping ;
  final UserLocalModel user ;
  final String nots ;
  DomandProduit({this.nombreDomand, this.listProduitBuy, this.addres, this.methodSopping, this.user, this.nots});

  factory DomandProduit.fromJson(Map<String , dynamic>  json){

    return DomandProduit(
      nombreDomand: json['nombreDomand']  ,
      listProduitBuy: json['listProduitBuy'] ,
      addres: json['addres'] ,
      methodSopping: json['methodSopping'] ,
      user: json['user'] ,
      nots: json['nots'] ,
    ) ;
  }

  Map<String , dynamic > toMap(){

    return {
      'nombreDomand' : nombreDomand ,
      'listProduitBuy' : listProduitBuy  ,
      'addres' : addres ,
      'methodSopping' : methodSopping ,
      'user' :user ,
      'nots' : nots ,

    };
  }
}
