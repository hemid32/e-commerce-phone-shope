


import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/produit/produit.dart';

List<ModelCart> itemsCart(){

  List<ModelCart> item = [
    ModelCart.FormJson({
      'produit' : Produit.formJson({
        'image' : 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
        'nomPhone' : 'Samsung 2x2 9a ' ,
        'detail': 'details bla bla bla bla bla bla ' ,
        'phoneType' : 'Samsung' ,
        'ram' : 4 ,
        'storage' : 2 ,
        'contitu' : 10 ,
        'price' : 144.2 ,
      }),
    }),
    ModelCart.FormJson({
      'produit' : Produit.formJson({
        'image' : 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
        'nomPhone' : 'Samsung 2x2 9a ' ,
        'detail': 'details bla bla bla bla bla bla ' ,
        'phoneType' : 'Samsung' ,
        'ram' : 4 ,
        'storage' : 20 ,
        'contitu' : 10 ,
        'price' : 144.2 ,
      }),
    }),
    ModelCart.FormJson({
      'produit' : Produit.formJson({
        'image' : 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
        'nomPhone' : 'Samsung 2x2 9a ' ,
        'detail': 'details bla bla bla bla bla bla ' ,
        'phoneType' : 'Samsung' ,
        'ram' : 4 ,
        'storage' : 20 ,
        'contitu' : 10 ,
        'price' : 144.2 ,
      }),
    }),
    ModelCart.FormJson({
      'produit' : Produit.formJson({
        'image' : 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
        'nomPhone' : 'Samsung 2x2 9a ' ,
        'detail': 'details bla bla bla bla bla bla ' ,
        'phoneType' : 'Samsung' ,
        'ram' : 4 ,
        'storage' : 20 ,
        'contitu' : 10 ,
        'price' : 144.2 ,
      }),
    }),
  ];


  ListModelCarte listItems = ListModelCarte.FormJson({
    'itemCart': item
  });

  return listItems.itemCart ;





}