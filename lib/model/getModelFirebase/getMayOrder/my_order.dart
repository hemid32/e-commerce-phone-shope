

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phoneshop/model/domand/model.dart';

class GetMyOrder {



  Future<ListDomands> getListDomandsFinich() async{
    final List<DomandProduit> _listDomand = await getDomandMineFromFireBase() ;
    List<DomandProduit> _domandSentRequest = [] ;
    _listDomand.forEach((element) {
      if(element.stateDomand == 2){
        _domandSentRequest.add(element) ;
      }
    });
    ListDomands _result = ListDomands.fromJson({
      'domands' : _domandSentRequest ,
    });
    return _result ;
  }

  Future<ListDomands> getListDomandsCharging() async{
    final List<DomandProduit> _listDomand = await getDomandMineFromFireBase() ;
    List<DomandProduit> _domandSentRequest = [] ;
    _listDomand.forEach((element) {
      if(element.stateDomand == 1 ){
        _domandSentRequest.add(element) ;
      }
    });
    ListDomands _result = ListDomands.fromJson({
      'domands' : _domandSentRequest ,
    });
    return _result ;
  }

  Future<ListDomands> getListDomandsSendRequest() async{
    final List<DomandProduit> _listDomand = await getDomandMineFromFireBase() ;
    List<DomandProduit> _domandSentRequest = [] ;
    _listDomand.forEach((element) {
      if(element.stateDomand == 0 ){
        _domandSentRequest.add(element) ;
      }
    });
    ListDomands _result = ListDomands.fromJson({
      'domands' : _domandSentRequest ,
    });
    return _result ;
  }



  Future<ListDomands> getToTalListDomands()async{
    final List<DomandProduit> _listDomand = await getDomandMineFromFireBase() ;
    ListDomands _result = ListDomands.fromJson({
      'domands' : _listDomand ,
    });
    return _result ;
  }



  Future<List<DomandProduit>> getDomandMineFromFireBase()async  {
    String uid = FirebaseAuth.instance.currentUser.uid ;
    final    document =   FirebaseFirestore.instance.collection('domands').where('uid' , isEqualTo: uid);
    final  _data =  await document.get() ;
    List<DomandProduit> _listDomands = [] ; 
    _data.docs.forEach((element) { 
      _listDomands.add(DomandProduit.fromJsonGetFireBase(Map<String, dynamic>.from(element.data()['domand']))) ;
    });
    return _listDomands ;
  }



  Future<DomandProduit> getItemDOmand(uidOrder)async {
    final _listDoman = await getDomandMineFromFireBase() ;
    DomandProduit _domand ;
    _listDoman.forEach((element) {
      if(element.uidDomand == uidOrder){
        _domand = element ;
      }
    });
    return _domand ;
  }








}