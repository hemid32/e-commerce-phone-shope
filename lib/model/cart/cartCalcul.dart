

class ModelCartCalcul {

  final double? totalProduit ;
  final  double? totalShopping ;
  final total ;

  ModelCartCalcul({ this.totalProduit,  this.totalShopping, this.total});

  factory ModelCartCalcul.FromJson(Map<String , dynamic> json ){

    return ModelCartCalcul(
      total: json['total'] ,
      totalProduit:  json['totalProduit'] ,
      totalShopping: json['totalShopping']
    );
  }






}