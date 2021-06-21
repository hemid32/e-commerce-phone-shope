



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
  final int stateDomand ;
  final double priceShopping ;
  final  double priceTotalProduit ;
  final double total ;
  DomandProduit( {this.nombreDomand, this.listProduitBuy, this.addres, this.methodSopping, this.user, this.nots ,this.stateDomand , this.priceShopping, this.priceTotalProduit, this.total, });

  factory DomandProduit.fromJson(Map<String , dynamic>  json){

    return DomandProduit(
      nombreDomand: json['nombreDomand']  ,
      listProduitBuy: json['listProduitBuy'] ,
      addres: json['addres'] ,
      methodSopping: json['methodSopping'] ,
      user: json['user'] ,
      nots: json['nots'] ,
      stateDomand: json['stateDomand'] ,
      priceShopping: json['priceShopping'] ,
      priceTotalProduit: json['priceTotalProduit'] ,
      total: json['total']

    ) ;
  }

  Map<String , dynamic > toMap(){

    return {
      'nombreDomand' : nombreDomand ,
      'listProduitBuy' : listProduitBuy.toMap()  ,
      'addres' : addres.toMap() ,
      'methodSopping' : methodSopping.toMap() ,
      'user' :user.toMap() ,
      'nots' : nots ,
      'stateDomand': stateDomand  ,
      'priceShopping' :  priceShopping ,
      'priceTotalProduit': priceTotalProduit ,
      'total':total ,
    };
  }
}
