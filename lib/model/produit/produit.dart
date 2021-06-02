
class Produit {
  final String image ;
  final String nomPhone ;
  final String detail ;
  final String phoneType  ;
  final int ram  ;
  final int storage ;
  final int  contitu ;
  final double price  ;
  final double priceOriginal ;
  final String spu ;
  //final String imageColors  ;
  Produit( {this.spu,this.image, this.nomPhone, this.detail, this.phoneType, this.ram, this.storage, this.contitu, this.price , this.priceOriginal });

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
      priceOriginal: jSonData['priceOriginal'] ,
      spu: jSonData['spu'],
    ) ;
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'nomPhone': nomPhone,
      'detail':detail ,
      'phoneType':phoneType ,
      'ram': ram ,
      'storage':storage ,
      'contitu': contitu ,
      'price':price ,
      'priceOriginal':priceOriginal ,
      'spu':spu ,


    };
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