


import 'package:phoneshop/model/produit/produit.dart';

class ProduitsColors {
  final String   nomPhone  ;
  final String   imagePosterPhone ;
  final List<Produit> listProduits ;
  final int contitu ;
  final int nombrePay ; // best saller
  final String typePhone;
  final bool isFavorite;
  final String id ;

  ProduitsColors({this.nomPhone, this.listProduits, this.contitu, this.imagePosterPhone, this.nombrePay , this.typePhone , this.isFavorite = false , this.id});

  factory ProduitsColors.fromJson(Map<String , dynamic> json){
    return ProduitsColors(
        nomPhone: json['nomPhone'] ,
        imagePosterPhone: json['imagePosterPhone'] ,
        listProduits: json['listProduits'] ,
        contitu : json['contitu'] ,
        nombrePay :json['nombrePay'] ,
        typePhone :json['typePhone'] ,
        isFavorite:  json['isFavorite'] ,
        id: json['id']
    );
  }


  Map<String , dynamic> toMap(){

    return {
      'nomPhone' : nomPhone ,
      'imagePosterPhone' : imagePosterPhone ,
      'listProduits' : listProduitsToMap() ,
      'contitu' : contitu ,
      'nombrePay' : nombrePay ,
      'typePhone' : typePhone ,
      'isFavorite' : isFavorite ,
      'id' : id ,
    } ;


  }


  listProduitsToMap(){
    List<Map<String,dynamic>> _listProduiMaps = [];
    listProduits.forEach((element) {
      _listProduiMaps.add(element.toMap()) ;
    }) ;
    return _listProduiMaps  ;

  }

}

class ListProduitsColors{
  final  List<ProduitsColors> produits ;
  ListProduitsColors({this.produits});
  factory ListProduitsColors.fronJson(
      Map<String ,  List<ProduitsColors>  > json
      ){
    return ListProduitsColors(
      produits: json['produits']

    );
  }



  Map<String , dynamic>toMap(){
    return {
      'produits' : _ListProduitsColorsToMap() ,
    };
  }


  _ListProduitsColorsToMap(){
    List<Map<String,dynamic>> _listMapListProduitsColors = [] ;
    produits.forEach((element) {
      _listMapListProduitsColors.add(element.toMap()) ;
    });

    return _listMapListProduitsColors ;
  }



}