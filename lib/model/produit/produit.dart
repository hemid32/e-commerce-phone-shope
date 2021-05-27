
class Produit {
  final String image ;
  final String nomPhone ;
  final String detail ;
  final String phoneType  ;
  final int ram  ;
  final  int storage ;
  final int    contitu ;
  final double price  ;
  Produit({this.image, this.nomPhone, this.detail, this.phoneType, this.ram, this.storage, this.contitu, this.price});


  factory Produit.formJson(Map<String , dynamic > jSonData){

    return Produit(
      image : jSonData['image'] ,
      nomPhone : jSonData['nomPhone'] ,
      detail : jSonData['detail'] ,
      phoneType : jSonData['phoneType'] ,
      ram :  jSonData['ram'] ,
      storage : jSonData['storage'] ,
      contitu : jSonData['contitu'] ,
      price :  jSonData['price'] ,
    ) ;
  }
}


class TotalProduits {
  final  List<Produit> produits  ;
  TotalProduits({this.produits});
  factory TotalProduits.fromJson(Map<String, dynamic> jsnData){

    return TotalProduits(
      produits: jsnData['produits']
    ) ;
  }
}