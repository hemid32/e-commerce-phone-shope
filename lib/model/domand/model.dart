import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/puy/address.dart';
import 'package:phoneshop/model/puy/shopping.dart';
import 'package:phoneshop/model/puy/shopping_method_is_shoi.dart';
import 'package:phoneshop/model/user/user.dart';

class DomandProduit {
  final int nombreDomand;
  final ListModelCarte listProduitBuy;
  final ModelAdress addres;
  final MethodShoppingShoi methodSopping;
  final UserLocalModel user;
  final String nots;
  final int stateDomand;
  final double priceShopping;
  final double priceTotalProduit;
  final double total;
  final DateTime date ;
  final String uidDomand ;
  DomandProduit({
    this.nombreDomand,
    this.listProduitBuy,
    this.addres,
    this.methodSopping,
    this.user,
    this.nots,
    this.stateDomand,
    this.priceShopping,
    this.priceTotalProduit,
    this.total,
    this.date ,
    this.uidDomand ,
  });


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
        total: json['total'] ,
        date : json['date'] ,
      uidDomand: json['uidDomand'] ,

    ) ;
  }





  factory DomandProduit.fromJsonGetFireBase(Map<String, dynamic> json) {
    List<ModelCart>   listP =[] ; // = ghrt(json['listProduitBuy']['itemCart']) ;
    json['listProduitBuy']['itemCart']
        .forEach((elements) => listP.add(ModelCart.FormJson({
      'produit': Produit.formJson(elements['produit']),
      'contituPay': elements['contituPay'],
      'idProduitColors': elements['idProduitColors'],
    })));

    return DomandProduit(
        nombreDomand: json['nombreDomand'],


        listProduitBuy: ListModelCarte.FormJson({
          'itemCart': listP,
        }), //json['listProduitBuy']   ,






        addres: ModelAdress.fromJson(
          json['addres'],
        ), // json['addres'] ,
        methodSopping: MethodShoppingShoi.froJson({
          'fin': json['methodSopping']['fin'],
          'method': ShoppingModelMethod.fromJson({
            'titleMethod': json['methodSopping']['method']['titleMethod'],
            'price': json['methodSopping']['method']['price'],
            'wilayaSupport': List<String>.from(
                json['methodSopping']['method']['wilayaSupport'])
          }),
        }), //json['methodSopping'] ,
        user: UserLocalModel.fromJson(json['user']), //json['user'] ,
        nots: json['nots'],
        stateDomand: json['stateDomand'],
        priceShopping: json['priceShopping'],
        priceTotalProduit: json['priceTotalProduit'],
        total: json['total'],
        date: json['date'].toDate() ,
        uidDomand: json['uidDomand']

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombreDomand': nombreDomand,
      'listProduitBuy': listProduitBuy.toMap(),
      'addres': addres.toMap(),
      'methodSopping': methodSopping.toMap(),
      'user': user.toMap(),
      'nots': nots,
      'stateDomand': stateDomand,
      'priceShopping': priceShopping,
      'priceTotalProduit': priceTotalProduit,
      'total': total,
      'date' : DateTime.now() ,
      'uidDomand' : uidDomand ,
    };
  }
}

class ListDomands {
  final List<DomandProduit> domands;
  ListDomands({this.domands});
  factory ListDomands.fromJson(Map<String, dynamic> json) {
    return ListDomands(domands: json['domands']);
  }
}
