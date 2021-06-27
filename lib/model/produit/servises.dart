


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:uuid/uuid.dart';



var uuid = Uuid();


Map<String ,  List<Produit>> produitses =

{

  'produits' : [
    Produit.formJson({
      'image' : 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
      'nomPhone' : 'Samsung 2x2 9a ' ,
      'detail': 'details bla bla bla bla bla bla ' ,
      'phoneType' : 'Samsung' ,
      'ram' : 4 ,
      'storage' : 120 ,
      'contitu' : 5 ,
      'price' : 50000.0 ,
      'priceOriginal' : 150.0 ,
      'spu' : 'dragon 125',
      'id' : 1 ,
      'camera' : 48



    }),
    Produit.formJson({
      'image' : 'assets/images/iphone-x-samsung-galaxy-s8-iphone-7-smartphone-png-favpng-7ke4DBbj5kLrbQftMD6XuN56h.jpg' ,
      'nomPhone' : 'ALG 4 pm' ,
      'detail': 'details bla bla bla bla bla bla ',
      'phoneType' : 'ALG' ,
      'ram' : 6 ,
      'storage' : 20 ,
      'contitu' : 20 ,
      'price' : 6000.2 ,
      'priceOriginal' : 150.0 ,
      'spu' : 'dragon 125' ,
      'id' : 2 ,
      'camera' : 68


    }),
    Produit.formJson({
      'image' : 'assets/images/poco.png' ,
      'nomPhone' : 'poco a3 ' ,
      'detail': 'details bla bla bla bla bla bla ' ,
      'phoneType' : 'poco a3 ' ,
      'ram' : 6 ,
      'storage' : 80 ,
      'contitu' : 25 ,
      'price' : 3500.0 ,
      'priceOriginal' : 150.0 ,
      'spu' : 'dragon 125' ,
      'id': 3 ,
      'camera' : 108


    }),
    Produit.formJson({
      'image' : 'assets/images/Redmi_Note_9_Pro_5G_6.png' ,
      'nomPhone' : 'Redmi not 9 ' ,
      'detail': 'details bla bla bla bla bla bla' ,
      'phoneType' : 'xiaomi' ,
      'ram' : 12 ,
      'storage' : 150 ,
      'contitu' : 60 ,
      'price' : 55000.0,
      'priceOriginal' : 150.0 ,
      'spu' : 'dragon 125' ,
      'id': 4 ,
      'camera' : 48

    }),
    Produit.formJson({
      'image' : 'assets/images/RedmiNote10Pro-Bronze.png' ,
      'nomPhone' : 'RedmiNote10Pro' ,
      'detail': 'details bla bla bla bla bla bla' ,
      'phoneType' : 'xiaomi' ,
      'ram' : 16 ,
      'storage' : 100 ,
      'contitu' : 100 ,
      'price' : 70000.0,
      'priceOriginal' : 150.0,
      'spu' : 'dragon 125' ,
      'id': 5 ,
      'camera' : 13


    }),

  ]

} ;

List<Produit> produitesessss = produitses['produits'] ;

TotalProduits getProsuits(){

   TotalProduits result = TotalProduits.fromJson(produitses);
  return result ;

}



ListProduitsColors getProduitColors(){

  //print(produitses['produits'][1].price)  ;
  //print(getProsuits().produits[0].nomPhone);

  List<ProduitsColors> list = [
    ProduitsColors.fromJson({
      'id' : uuid.v1(),
      'nomPhone': 'samsung' ,
      'imagePosterPhone': 'assets/images/RedmiNote10Pro-Bronze.png' ,
      'listProduits':  getProsuits().produits,// produitses['produits'] ,
      'contitu' : 100 ,
      'nombrePay' : 6 ,
      'typePhone': 'samsung' ,
      'isFavorite' : false ,

    }),
    ProduitsColors.fromJson({
      'id' : uuid.v1()  ,
      'nomPhone': 'alge' ,
      'imagePosterPhone': 'assets/images/samsung-galaxy-s8-4g-smartphone-png-favpng-qNm18RuFag7316FekDYk0Pqy4.jpg' ,
      'listProduits' : produitses['produits'] ,
      'contitu' : 100 ,
      'nombrePay' : 4 ,
      'typePhone': 'Alg' ,
      'isFavorite' : false ,



    }),
    ProduitsColors.fromJson({
      'id' : uuid.v1() ,
      'nomPhone': 'alge' ,
      'imagePosterPhone': 'assets/images/iphone-x-samsung-galaxy-s8-iphone-7-smartphone-png-favpng-7ke4DBbj5kLrbQftMD6XuN56h.jpg' ,
      'listProduits' : produitses['produits'] ,
      'contitu' : 100 ,
      'nombrePay' : 1 ,
      'typePhone': 'XD' ,
        'isFavorite' : false ,



    }),
    ProduitsColors.fromJson({
      'id' : uuid.v1()  ,
      'nomPhone': 'redmi 108' ,
      'imagePosterPhone': 'assets/images/poco.png' ,
      'listProduits' :  produitses['produits'] ,
      'contitu' : 100 ,
      'nombrePay' : 2 ,
      'typePhone': 'ALG' ,
      'isFavorite' : false ,



    }),
    ProduitsColors.fromJson({
      'id' : uuid.v1() ,
      'nomPhone': 'redmi 109' ,
      'imagePosterPhone': 'assets/images/RedmiNote10Pro-Bronze.png' ,
      'listProduits' : produitses['produits'] ,
      'contitu' : 100 ,
      'nombrePay' : 15 ,
      'typePhone': 'samsung' ,
      'isFavorite' : false ,



    }),


  ];
  ListProduitsColors resul = ListProduitsColors.fronJson({
   'produits' : list ,
  });

  //print('============================ ${resul.produits[0].listProduits}');
  return resul ;

}

///delet this function after fine

testCreatModelFromFireBase() async {
  //Map<String , dynamic> mapData = getProduitColors().toMap() ;
  //print('mapData === $mapData') ;


  try{
    CollectionReference _produits = FirebaseFirestore.instance.collection(
        'Produits');
    Map<String , dynamic> mapData = getProduitColors().toMap() ;
   // print('mapData === $mapData') ;
    getProduitColors().produits.forEach((element) async {
      await _produits.add(
        element.toMap() ,


      );
    });
    
    return true ;
  }catch(e){
    print('errur ===========*==*==*===*====*==============================================  $e}') ;
    return e ;
  }


}