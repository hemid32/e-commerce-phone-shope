


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/cart/services.dart';
import 'package:phoneshop/model/domand/model.dart';
import 'package:uuid/uuid.dart';

class SandDmndToFireBase {
  final  DomandProduit  domand  ;
  Map<String , dynamic>? domandMap ;

  var uuid = Uuid() ;

  SandDmndToFireBase(this.domand);

  toFireBase() async {
    domandMap = domand.toMap() ;
     try{
       CollectionReference _domands = FirebaseFirestore.instance.collection(
           'domands');
       await _domands.add({
         'uid' : FirebaseAuth.instance.currentUser!.uid ,
         'domand' : domandMap ,
       });
       await _modificationContituesFronFirebas() ;
       await deletTotalItemFromCatr() ;
       return true ;
     }catch(e){
       print('errur $e}') ;
       return e.toString() ;
     }
  }

  _modificationContituesFronFirebas( )async {
    domand.listProduitBuy.itemCart.forEach((element) async  {
      //element.
      // element.idProduitColors   ;
     //element.produit.id ;
      // element.contituPay ;
      await _minimusContitu(element.idProduitColors!, element.produit!.id!, element.contituPay!) ;
    });
    //final CollectionReference  _produits = await  FirebaseFirestore.instance.collection('Produits');
  }

  _minimusContitu(String idProduitColors , int idProduit , int contituBuy ) async  {
    final    produits = await  FirebaseFirestore.instance.collection('Produits');
    var _data =  await produits.get() ;
    int oldContitu ;
    int newContitu ;
    //_InternalLinkedHashMap<String, dynamic> to Map<String,dynamic> == try ==> Map<String, dynamic>.from(yourData)
    for(var  element in _data.docs){
      //print('id docs produits from firebase==== ${element.id}') ;
      Map<String, dynamic> _data = Map<String, dynamic>.from(element.data()) ;
      if(_data['id'] ==   idProduitColors ){
        var listProduits = _data['listProduits'] ;
        _data['listProduits'].forEach((_produit) async  {
          if(_produit['id'] == idProduit){
            oldContitu = _produit['contitu'] ;
            newContitu = oldContitu - contituBuy ;
            int indexProduit = _data['listProduits'].indexOf(_produit) ;
            _produit['contitu'] = newContitu ;
            listProduits[indexProduit] = _produit ;
            await  produits.doc(element.id).update({'listProduits' : listProduits});
            //await  _modificationContituesFronFirebas(newContitu ,element.id ,idProduitColors , idProduit  ) ;
          }
        });
      }

    }
  }

}


class CancelDomandSanded {

  final String  uidDomand ;
  //final String idDoc ;
  CancelDomandSanded({required this.uidDomand });
  deletFromFireBase() async  {
    String uidDoc = await  getIdDecDomand() ;
    CollectionReference _domand = FirebaseFirestore.instance.collection('domands');
    try{
      await _domand.doc(uidDoc).delete() ;
      return true ;
    }catch(e){
      print('errrue delet doc == $e ') ;
      return e ;
    }
  }
  getIdDecDomand() async  {
    final  _domand = FirebaseFirestore.instance.collection('domands');
    var d = await _domand.get() ;
    late String uidDmnd ;
    d.docs.forEach((element) {
     Map<String, dynamic> _domandItem = Map<String, dynamic>.from(element.data())   ;
     if(_domandItem['domand']['uidDomand'] == uidDomand ){
       //return element.id ;
       uidDmnd = element.id ;
     }
    });
    return uidDmnd ;

  }







}