


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
       await _modificationContituesFronFirebas() ;
       await deletTotalItemFromCatr() ;
       return true ;
     }catch(e){
       print('errur $e}') ;
       return e.message ;
     }




  }



  _modificationContituesFronFirebas( )async {



    domand.listProduitBuy.itemCart.forEach((element) async  {
      //element.
      // element.idProduitColors   ;
     //element.produit.id ;
      // element.contituPay ;
      await _minimusContitu(element.idProduitColors, element.produit.id, element.contituPay) ;
    });



    //final CollectionReference  _produits = await  FirebaseFirestore.instance.collection('Produits');








  }

  _minimusContitu(String idProduitColors , int idProduit , int contituBuy ) async  {
    final CollectionReference  produits = await  FirebaseFirestore.instance.collection('Produits');
    var _data =  await produits.get() ;
    int oldContitu ;
    int newContitu ;
    //_InternalLinkedHashMap<String, dynamic> to Map<String,dynamic> == try ==> Map<String, dynamic>.from(yourData)
    _data.docs.forEach((element)   {
      print('id docs produits from firebase==== ${element.id}') ;
      var _data = Map<String, dynamic>.from(element.data()) ;
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

      //if(element.data())

    });




  }





}