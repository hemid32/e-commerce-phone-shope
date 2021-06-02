


import 'package:hive/hive.dart';
import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/hiveModel/hive_cart.dart';
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
        'price' :10.0 ,
      }),
      'contituPay' : 1 ,
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
        'price' : 20.0 ,
      }),
      'contituPay' : 3,

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
        'price' : 10.0 ,
      }),
      'contituPay' : 4 ,

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
        'price' : 15.0 ,
      }),
      'contituPay' : 10,

    }),
  ];


  ListModelCarte listItems = ListModelCarte.FormJson({
    'itemCart': item
  });

  return listItems.itemCart ;





}


Future<List<ModelCart>> getListModelCart() async {
  var box = await Hive.openBox('ModelCart');
  //List<ModelCart>  modelCart = box.values.toList() ;
  //return modelCart ;
  print('comencer getListModelCart ');
  ModelCart models ;
  Produit produit ;
  int contint ;
  List<ModelCart> listModels = [] ;
  //print(box.values[0]['produit']['image']) ;

  box.values.forEach((element) {
    //print('element ===${element}') ;
    produit = Produit.formJson({
      'image': element.modelCart['produit']['image'],
      'nomPhone': element.modelCart['produit']['nomPhone'],
      'detail':element.modelCart['produit']['detail'] ,
      'phoneType':element.modelCart['produit']['phoneType'] ,
      'ram': element.modelCart['produit']['ram']  ,
      'storage':element.modelCart['produit']['storage']  ,
      'contitu': element.modelCart['produit']['contitu']  ,
      'price':element.modelCart['produit']['price'] ,
      'priceOriginal':element.modelCart['produit']['priceOriginal'] ,
      'spu':element.modelCart['produit']['spu'] ,
    });

    contint = element.modelCart['contituPay'] ;
    models = ModelCart.FormJson({
      'produit': produit ,
      'contituPay': contint ,
    }) ;
    //print('models ==== $models');
    listModels.add(models) ;
  });
  print('listModels = $listModels');
  return listModels ;
}


savModelCart(Map<String , dynamic> model) async {
  try {
    //print('model ==$model') ;
    var box = await Hive.openBox('ModelCart');
    var models = CartHive()
      ..modelCart = model;
    box.add(models).then((value) => print('add new produit cart is secsesuff '));
    return true ;
  }catch(e){

    //print('errurr from savModelCart ==$e ') ;
    return false  ;
  }
}


deleItemFromCart(int indexItem) async  {
    var box = await Hive.openBox('ModelCart');
    box.deleteAt(indexItem)
        .then((value) => print('dleted item $indexItem sescesuf'))
        .onError((error, stackTrace) => print('eruur not delet itme == $error}'));


}

