


import 'package:phoneshop/model/produit/produit.dart';

class ModelCart {
  final Produit produit ;
  final int  contituPay ;
  ModelCart({this.produit, this.contituPay = 1  });
  factory ModelCart.FormJson(Map<String  , dynamic > json ){
    return ModelCart(
      produit: json['produit'] ,
      contituPay: json['contituPay']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'produit': produit,
      'contituPay': contituPay,
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

      }) ;


    });
    return _listItemCartMap ;

  }





}