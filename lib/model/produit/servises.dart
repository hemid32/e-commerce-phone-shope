


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:uuid/uuid.dart';



var uuid = Uuid();


Map<String ,  List<Produit>> docco =

{

  'produits' : [
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/H69e003dfd2b9459280cf5ce007f946a8p/DOOGEE-S96-Pro-mobile-phone-Smartphone-48MP-Round-Quad-Camera-20MP-Infrared-Night-Vision-Helio-G90.jpg_640x640.jpg' ,
      'nomPhone' : 'DOOGEE S96 Pro  ' ,
      'detail': 'DOOGEE S96 Pro mobile phone Smartphone 48MP Round Quad Camera 20MP Infrared Night Vision Helio G90 Octa Core 8GB+128GB 6350mAh' ,
      'phoneType' : 'DOOGEE' ,
      'ram' : 8 ,
      'storage' : 128 ,
      'contitu' : 3 ,
      'price' : 42000.0 ,
      'priceOriginal' : 56000.0 ,
      'spu' : 'Helio G90Octa Core 2.0GHz 12nm',
      'id' : 1 ,
      'camera' : 48 ,
      'idProduitUique' : uuid.v4() ,



    }),
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/H166ad845569845ea801c1a383a4d98feZ/DOOGEE-S96-Pro-mobile-phone-Smartphone-48MP-Round-Quad-Camera-20MP-Infrared-Night-Vision-Helio-G90.jpg_640x640.jpg' ,
      'nomPhone' : 'DOOGEE S96 Pro  ' ,
      'detail': 'DOOGEE S96 Pro mobile phone Smartphone 48MP Round Quad Camera 20MP Infrared Night Vision Helio G90 Octa Core 8GB+128GB 6350mAh' ,
      'phoneType' : 'DOOGEE' ,
      'ram' : 8 ,
      'storage' : 128 ,
      'contitu' : 3 ,
      'price' : 48000.0 ,
      'priceOriginal' : 58000.0 ,
      'spu' : 'Helio G90Octa Core 2.0GHz 12nm',
      'id' : 2 ,
      'camera' : 48 ,
      'idProduitUique' : uuid.v4() ,



    }),

  ]

} ;

Map<String ,  List<Produit>> redmi10 =

{

  'produits' : [
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/H252e4a9f9384428aa3779296bb9c4312b/Global-Version-Xiaomi-Redmi-Note-10-Pro-6GB-RAM-64GB-128GB-ROM-Mobile-Phone-108MP-Camera.jpg_640x640.jpg' ,
      'nomPhone' : 'Xiaomi Redmi Note 10 Pro' ,
      'detail': 'Global Version Xiaomi Redmi Note 10 Pro 6GB RAM 64GB / 128GB ROM Mobile Phone 108MP Camera Snapdragon 732G 120Hz AMOLED Display' ,
      'phoneType' : 'xiaomi' ,
      'ram' : 6 ,
      'storage' : 64 ,
      'contitu' : 2 ,
      'price' : 43000.0 ,
      'priceOriginal' : 65000.0 ,
      'spu' : 'Snapdragon 732G 120Hz',
      'id' : 1 ,
      'camera' : 108  ,
      'idProduitUique' : uuid.v4() ,



    }),
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/Hec8929149d77439fa7b7eba82df7e6e2w/Global-Version-Xiaomi-Redmi-Note-10-Pro-6GB-RAM-64GB-128GB-ROM-Mobile-Phone-108MP-Camera.jpg_640x640.jpg' ,
      'nomPhone' : 'Xiaomi Redmi Note 10 Pro' ,
      'detail': 'Global Version Xiaomi Redmi Note 10 Pro 6GB RAM 64GB / 128GB ROM Mobile Phone 108MP Camera Snapdragon 732G 120Hz AMOLED Display' ,
      'phoneType' : 'xiaomi' ,
      'ram' : 8 ,
      'storage' : 128 ,
      'contitu' : 3 ,
      'price' : 45000.0 ,
      'priceOriginal' : 62000.0 ,
      'spu' : 'Snapdragon 732G 120Hz',
      'id' : 2 ,
      'camera' : 108  ,
      'idProduitUique' : uuid.v4() ,



    }),

  ]

} ;
Map<String ,  List<Produit>> galaxyS21 =

{

  'produits' : [
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/H2fa9c851ecd8468dbcc01538d7376705p/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_640x640.jpg' ,
      'nomPhone' : 'Galaxy S21 Ultra' ,
      'detail': ' Galaxy S21 Ultra Smartphone 7.2 Inch Original Authentic 5800mAh 10.0 Dual SIM Card 32MP Global Version Android mobile phones' ,
      'phoneType' : 'samsung' ,
      'ram' : 8 ,
      'storage' : 256 ,
      'contitu' :2,
      'price' : 16000.0 ,
      'priceOriginal' : 23000.0 ,
      'spu' : 'MTK6889',
      'id' : 1 ,
      'camera' : 32 ,
      'idProduitUique' : uuid.v4() ,



    }),
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/Hd3a9b277e5824b2fbc48ea0d120555e13/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_640x640.jpg' ,
      'nomPhone' : 'Galaxy S21 Ultra' ,
      'detail': ' Galaxy S21 Ultra Smartphone 7.2 Inch Original Authentic 5800mAh 10.0 Dual SIM Card 32MP Global Version Android mobile phones' ,
      'phoneType' : 'samsung' ,
      'ram' : 8 ,
      'storage' : 256 ,
      'contitu' :4,
      'price' : 16000.0 ,
      'priceOriginal' : 23000.0 ,
      'spu' : 'MTK6889',
      'id' : 1 ,
      'camera' : 32 ,
      'idProduitUique' : uuid.v4() ,



    }),
   Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/Hc6363c36c3054008a00346b59a9ac1b6X/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_Q90.jpg' ,
      'nomPhone' : 'Galaxy S21 Ultra' ,
      'detail': ' Galaxy S21 Ultra Smartphone 7.2 Inch Original Authentic 5800mAh 10.0 Dual SIM Card 32MP Global Version Android mobile phones' ,
      'phoneType' : 'samsung' ,
      'ram' : 8 ,
      'storage' : 256 ,
      'contitu' :1,
      'price' : 16000.0 ,
      'priceOriginal' : 23000.0 ,
      'spu' : 'MTK6889',
      'id' : 1 ,
      'camera' : 32 ,
     'idProduitUique' : uuid.v4() ,

   }),

  ]

} ;

Map<String ,  List<Produit>> galaxyS21_2 =

{

  'produits' : [
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/H2fa9c851ecd8468dbcc01538d7376705p/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_640x640.jpg' ,
      'nomPhone' : 'Galaxy S21 Ultra' ,
      'detail': ' Galaxy S21 Ultra Smartphone 7.2 Inch Original Authentic 5800mAh 10.0 Dual SIM Card 32MP Global Version Android mobile phones' ,
      'phoneType' : 'samsung' ,
      'ram' : 8 ,
      'storage' : 512 ,
      'contitu' :6,
      'price' : 21000.0 ,
      'priceOriginal' : 24000.0 ,
      'spu' : 'MTK6889',
      'id' : 1 ,
      'camera' : 32 ,
      'idProduitUique' : uuid.v4() ,



    }),
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/Hd3a9b277e5824b2fbc48ea0d120555e13/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_640x640.jpg' ,
      'nomPhone' : 'Galaxy S21 Ultra' ,
      'detail': ' Galaxy S21 Ultra Smartphone 7.2 Inch Original Authentic 5800mAh 10.0 Dual SIM Card 32MP Global Version Android mobile phones' ,
      'phoneType' : 'samsung' ,
      'ram' : 8 ,
      'storage' : 512 ,
      'contitu' :2,
      'price' : 21000.0 ,
      'priceOriginal' : 24000.0 ,
      'spu' : 'MTK6889',
      'id' : 2 ,
      'camera' : 32 ,

      'idProduitUique' : uuid.v4() ,


    }),
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/Hc6363c36c3054008a00346b59a9ac1b6X/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_Q90.jpg' ,
      'nomPhone' : 'Galaxy S21 Ultra' ,
      'detail': ' Galaxy S21 Ultra Smartphone 7.2 Inch Original Authentic 5800mAh 10.0 Dual SIM Card 32MP Global Version Android mobile phones' ,
      'phoneType' : 'samsung' ,
      'ram' : 8 ,
      'storage' : 512 ,
      'contitu' :4,
      'price' : 21000.0 ,
      'priceOriginal' : 24000.0 ,
      'spu' : 'MTK6889',
      'id' : 3 ,
      'camera' : 32 ,
      'idProduitUique' : uuid.v4() ,

    }),

  ]

} ;
Map<String ,  List<Produit>> iphonx =

{

  'produits' : [
    Produit.formJson({
      'image' : 'https://ae01.alicdn.com/kf/HTB1O6xdXUvrK1RjSspcq6zzSXXax/Original-Apple-iPhone-X-3GB-RAM-64GB-256GB-ROM-5-8-iOS-Hexa-core-12-0MP.jpg_Q90.jpg' ,
      'nomPhone' : 'iPhone X' ,
      'detail': 'Original Apple iPhone X 3GB RAM 64GB 256GB ROM 5.8" iOS Hexa core 12.0MP Dual Back Camera Unlocked 4G LTE Mobile Phone' ,
      'phoneType' : 'iphon' ,
      'ram' : 3 ,
      'storage' : 256 ,
      'contitu' :12,
      'price' : 21000.0 ,
      'priceOriginal' : 24000.0 ,
      'spu' : 'Hexa core',
      'id' : 1 ,
      'camera' : 12 ,
      'idProduitUique' : uuid.v4() ,




    }),


  ]

} ;



//List<Produit> produitesessss = produitses['produits'] ;
/*
TotalProduits getProsuits(){

   TotalProduits result = TotalProduits.fromJson(produitses);
  return result ;

}

 */



ListProduitsColors getProduitColors(){

  //print(produitses['produits'][1].price)  ;
  //print(getProsuits().produits[0].nomPhone);

  List<ProduitsColors> list = [
    ProduitsColors.fromJson({
      'id' : uuid.v1(),
      'nomPhone': 'xiaomi' ,
      'imagePosterPhone': 'src="https://ae01.alicdn.com/kf/H8c7961280c6740dba1fd0eb5df73dd483/Global-Version-Xiaomi-Redmi-Note-10-Pro-6GB-RAM-64GB-128GB-ROM-Mobile-Phone-108MP-Camera.jpg_Q90.jpg_.webp"' ,
      'listProduits':  redmi10['produits'],// produitses['produits'] ,
      'contitu' : 0 ,
      'nombrePay' : 0 ,
      'typePhone': 'xiaomi' ,
      'isFavorite' : false ,

    }),
    ProduitsColors.fromJson({
      'id' : uuid.v1()  ,
      'nomPhone': 'docco' ,
      'imagePosterPhone': 'https://ae01.alicdn.com/kf/Hf054ca0237e74cfca9f318416d4f5c72g/DOOGEE-S96-Pro-mobile-phone-Smartphone-48MP-Round-Quad-Camera-20MP-Infrared-Night-Vision-Helio-G90.jpg_Q90.jpg_.webp' ,
      'listProduits' : docco['produits'] ,
      'contitu' : 0 ,
      'nombrePay' : 0 ,
      'typePhone': 'docco' ,
      'isFavorite' : false ,

    }),

    ProduitsColors.fromJson({
      'id' : uuid.v1()  ,
      'nomPhone': 'samsung' ,
      'imagePosterPhone': 'https://ae01.alicdn.com/kf/H32cb9d2e0cbc4e2985950d54a0e773f0e/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_Q90.jpg' ,
      'listProduits' : galaxyS21['produits'] ,
      'contitu' : 0 ,
      'nombrePay' : 0 ,
      'typePhone': 'samsung' ,
      'isFavorite' : false ,

    }),

    ProduitsColors.fromJson({
      'id' : uuid.v1()  ,
      'nomPhone': 'samsung' ,
      'imagePosterPhone': 'https://ae01.alicdn.com/kf/H32cb9d2e0cbc4e2985950d54a0e773f0e/Galaxy-S21-Ultra-Smartphone-7-2-Inch-Original-Authentic-5800mAh-10-0-Dual-SIM-Card-32MP.jpg_Q90.jpg' ,
      'listProduits' : galaxyS21_2['produits'] ,
      'contitu' : 0 ,
      'nombrePay' : 0 ,
      'typePhone': 'samsung' ,
      'isFavorite' : false ,

    }),

    ProduitsColors.fromJson({
      'id' : uuid.v1()  ,
      'nomPhone': 'iphon' ,
      'imagePosterPhone': 'https://ae01.alicdn.com/kf/HTB1HydhXJfvK1RjSspfq6zzXFXas/Original-Apple-iPhone-X-3GB-RAM-64GB-256GB-ROM-5-8-iOS-Hexa-core-12-0MP.jpg_Q90.jpg' ,
      'listProduits' : iphonx['produits'] ,
      'contitu' : 0 ,
      'nombrePay' : 0 ,
      'typePhone': 'iphon' ,
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