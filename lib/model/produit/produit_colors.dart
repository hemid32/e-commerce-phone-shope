


import 'package:phoneshop/model/produit/produit.dart';

class ProduitsColors {
  final String   nomPhone  ;
  final String   imagePosterPhone ;
  final List<Produit> listProduits ;
  final int contitu ;
  final int nombrePay ; // best saller
  final String typePhone;
  final bool isFavorite;
  final int id ;

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

}