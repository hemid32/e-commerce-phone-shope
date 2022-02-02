class ModelAdress {
  final String nome ;
  final String prenome ;
  final String nomberPhone  ;
  final String email ;
  final String wilaya ;
  final String daira ;
  final String adress1 ;
  final String address2 ;
  final String id ;
  final int codPostal ;
  final bool fine  ;
  ModelAdress({required this.nome,
    required this.prenome,
    required this.nomberPhone,
    required this.email,
    required this.wilaya,
    required this.daira,
    required this.adress1,
  required  this.address2,
    required this.codPostal,
    this.fine = false ,
    required this.id});

  factory ModelAdress.fromJson(Map<String , dynamic> jsnData){
    //print('ModelAdress') ;
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
        id: jsnData['id']
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
      'id' : id ,
    } ;



  }



}