class ModelAdress {
  final String nome ;
  final String prenome ;
  final String nomberPhone  ;
  final String email ;
  final String wilaya ;
  final String daira ;
  final String adress1 ;
  final String address2 ;
  final int codPostal ;
  final bool fine  ;
  ModelAdress({this.nome, this.prenome, this.nomberPhone, this.email, this.wilaya, this.daira, this.adress1, this.address2, this.codPostal, this.fine = false});

  factory ModelAdress.fromJson(Map<String , dynamic> jsnData){
    return ModelAdress(
        nome : jsnData['nome'],
        prenome : jsnData['prenome'],
        nomberPhone : jsnData['nomberPhone'],
        email :jsnData['email'] ,
        wilaya: jsnData['wilaya'] ,
        daira: jsnData['daira'] ,
        adress1: jsnData['adress1'] ,
        address2: jsnData['address2'] ,
        codPostal: jsnData['codPostal'] ,
        fine: jsnData['fine'] ,
    ) ;
  }



  Map<String , dynamic> toMap(){

    return {
      'nome' : nome ,
      'prenome' : prenome ,
      'nomberPhone' : nomberPhone ,
      'email' : email  ,
      'wilaya' : wilaya ,
      'daira' : daira ,
      'adress1' : adress1 ,
      'address2' : address2 ,
      'codPostal' : codPostal ,
      'fine' : fine ,
    } ;



  }



}