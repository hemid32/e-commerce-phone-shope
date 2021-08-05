


import 'package:hive/hive.dart';
import 'package:phoneshop/model/cart/cart.dart';
import 'package:phoneshop/model/getModelFirebase/getTotalProduitColors.dart';
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
  //print('comencer getListModelCart ');
  String idProduitColors ;
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
      'camera' : element.modelCart['produit']['camera'] ,
      'id' : element.modelCart['produit']['id']
    });

    contint = element.modelCart['contituPay'] ;
    idProduitColors = element.modelCart['idProduitColors'] ;
    models = ModelCart.FormJson({
      'produit': produit ,
      'contituPay': contint ,
      'idProduitColors' : idProduitColors ,
    }) ;
    //print('models ==== $models');
    listModels.add(models) ;
  });
  //print('listModels = $listModels');
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


validerItemProduitIsFromCart(String idProduitColors , int idProduit  , int contitu)async  {
  var box = await Hive.openBox('ModelCart');
  bool _result  = false ;
  box.values.forEach((element) {
    //print('element.modelCart[produit][id] == ${element.modelCart['produit']['id']}') ;
    //print('element.modelCart[contituPay] == ${element.modelCart['contituPay']} )') ;
    if(element.modelCart['idProduitColors'] ==idProduitColors &&  element.modelCart['produit']['id'] == idProduit && element.modelCart['contituPay'] == contitu ){
      //print('produit from cart') ;
      _result =  true ;

    }
  });
  return _result ;
}

validerItemProduitIsDesponibleContitu(String idProduitColors , int idProduit  , int contitu) async  {
  var box = await Hive.openBox('ModelCart');
  GetProduitTotalFromFirebas _getFire = GetProduitTotalFromFirebas() ;
  bool _result  = false ;
  /*
  box.values.forEach((element) async   {
    //print('element.modelCart[produit][id] == ${element.modelCart['produit']['id']}') ;
    //print('element.modelCart[contituPay] == ${element.modelCart['contituPay']} )') ;
    if(element.modelCart['idProduitColors'] ==idProduitColors &&  element.modelCart['produit']['id'] == idProduit  ){
      //print('produit from cart') ;
      //_result =  true ;
      int contituFromFireBase = await   _getFire.nombreProduitFromFireBase(idProduitColors, idProduit) ;

      if(contituFromFireBase <  (contitu + element.modelCart['contituPay'] )){
        _result = true ;
      }

    }
  });
  */
  //print('begin loop') ;
  //print('box.values.toList().length ==${box.values.toList().length}') ;
  for(var i =0  ; i < box.values.toList().length ; i++ ){
    if(box.values.toList()[i].modelCart['idProduitColors'] ==idProduitColors &&  box.values.toList()[i].modelCart['produit']['id'] == idProduit  ){
      //print('produit from cart') ;
      //_result =  true ;
      int contituFromFireBase = await   _getFire.nombreProduitFromFireBase(idProduitColors, idProduit) ;
      print('contituFromFireBase ==== $contituFromFireBase');
      //print('box.values.toList()[i].modelCart['contituPay'] ==== $contituFromFireBase');
      if(contituFromFireBase <  (contitu + box.values.toList()[i].modelCart['contituPay'] )){
        _result = true ;
      }

    }

  }
  return _result ;
}




deletTotalItemFromCatr() async  {
  var box = await Hive.openBox('ModelCart');
  box.deleteFromDisk() ;
}