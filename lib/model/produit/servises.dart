


import 'package:phoneshop/model/produit/produit.dart';

TotalProduits getProsuits(){

   Map<String ,  List<Produit>> produitses =

    {

      'produits' : [
        Produit.formJson({
          'image' : 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
          'nomPhone' : 'Samsung 2x2 9a ' ,
          'detail': 'details bla bla bla bla bla bla ' ,
          'phoneType' : 'Samsung' ,
          'ram' : 4 ,
          'storage' : 20 ,
          'contitu' : 10 ,
          'price' : 144.2 ,
        }),
        Produit.formJson({
          'image' : 'assets/images/iphone-x-samsung-galaxy-s8-iphone-7-smartphone-png-favpng-7ke4DBbj5kLrbQftMD6XuN56h.jpg' ,
          'nomPhone' : 'ALG 4 pm' ,
          'detail': 'details bla bla bla bla bla bla ',
          'phoneType' : 'ALG' ,
          'ram' : 6 ,
          'storage' : 120 ,
          'contitu' : 20 ,
          'price' : 500.2 ,
        }),
        Produit.formJson({
          'image' : 'assets/images/poco.png' ,
          'nomPhone' : 'poco a3 ' ,
          'detail': 'details bla bla bla bla bla bla ' ,
          'phoneType' : 'poco a3 ' ,
          'ram' : 6 ,
          'storage' : 80 ,
          'contitu' : 25 ,
          'price' : 1500 ,
        }),
        Produit.formJson({
          'image' : 'assets/images/Redmi_Note_9_Pro_5G_6.png' ,
          'nomPhone' : 'Redmi not 9 ' ,
          'detail': 'details bla bla bla bla bla bla' ,
          'phoneType' : 'xiaomi' ,
          'ram' : 12 ,
          'storage' : 150 ,
          'contitu' : 60 ,
          'price' : 15000,
        }),
        Produit.formJson({
          'image' : 'assets/images/RedmiNote10Pro-Bronze.png' ,
          'nomPhone' : 'RedmiNote10Pro' ,
          'detail': 'details bla bla bla bla bla bla' ,
          'phoneType' : 'xiaomi' ,
          'ram' : 16 ,
          'storage' : 160 ,
          'contitu' : 100 ,
          'price' : 20000,
        }),

      ]

    }
  ;

   TotalProduits result = TotalProduits.fromJson(produitses);
  return result ;

}