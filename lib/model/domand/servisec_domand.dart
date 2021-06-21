


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/domand/model.dart';

class SandDmndToFireBase {
  final  DomandProduit  domand  ;
  Map<String , dynamic> domandMap ;

  SandDmndToFireBase(this.domand);
  /*
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

   */

  toFireBase() async {
    /*
    domandMap = {
      'nombreDomand' : 0 ,
      'ListModelCarte' : domand.listProduitBuy.toMap() ,
      'addres' : domand.addres.toMap() ,
      'methodSopping' : domand.methodSopping.toMap() ,
      'user' : domand.user.toMap() ,
      'nots' : domand.nots ,
      'stateDomand' : domand.stateDomand ,
      'priceShopping' : domand.priceShopping ,
      'total' : domand.total ,
    } ;

     */
    domandMap = domand.toMap() ;
     try{
       CollectionReference _domands = FirebaseFirestore.instance.collection(
           'domands');
       await _domands.add({
         'uid' : domandMap['user'] ,
         'domand' : domandMap ,
       });
       await deletTotalItemFromCatr() ;
       return true ;
     }catch(e){
       print('errur $e}') ;
       return e.message ;
     }




  }





}