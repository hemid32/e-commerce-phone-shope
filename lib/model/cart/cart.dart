


import 'package:phoneshop/model/produit/produit.dart';

class ModelCart {
  final Produit produit ;
  final int  contituPay ;
  final String idProduitColors ;
  final String id ;

  ModelCart({this.produit, this.contituPay = 1 , this.idProduitColors , this.id });
  factory ModelCart.FormJson(Map<String  , dynamic > json ){
    return ModelCart(
      produit: json['produit'] ,
      contituPay: json['contituPay'] ,
      idProduitColors: json['idProduitColors'] ,
      id: json['id']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'produit': produit,
      'contituPay': contituPay,
      'idProduitColors' : idProduitColors ,
      'id' : id
    };
  }

}

class ListModelCarte {
  final List<ModelCart> itemCart ;
  ListModelCarte({this.itemCart});
  factory ListModelCarte.FormJson(
      Map<String , List<ModelCart> > jsonDate
      ){
    return ListModelCarte(
      itemCart: jsonDate['itemCart'] ,
    );
  }


  Map<String , dynamic> toMap(){
    return {
      'itemCart' : convertItemCartToListMap()
    } ;

  }

  convertItemCartToListMap(){
    List<Map<String , dynamic>> _listItemCartMap = [] ;
    itemCart.forEach((element) {
      _listItemCartMap.add({
      'produit' : element.produit.toMap()  ,
        'contituPay' : element.contituPay ,
        'idProduitColors' : element.idProduitColors ,
         'id' : element.id ,

      }) ;


    });
    return _listItemCartMap ;

  }





}