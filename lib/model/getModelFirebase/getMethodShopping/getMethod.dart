

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/puy/shopping.dart';

class GetMethodShopping{
   final String   wilaya ;

  GetMethodShopping({this.wilaya});





  Future<TotalShoppingMethod> getTotalShoppingMethod() async  {

    List<ShoppingModelMethod> _listMethodses =  await getListMethodsFromFirebase()  ;
    TotalShoppingMethod _total = TotalShoppingMethod.fromJson(
      {
        'methods' : _listMethodses  ,
      }
    );

    return _total ;

  }


  Future<List<ShoppingModelMethod>> getListMethodsFromFirebase() async  {

    final    document =   FirebaseFirestore.instance.collection('MethodsShopping');
    var _data = await document.get() ;
    //var _methodData = Map<String, dynamic>.from(_data.docs[0].data()) ;
    List<ShoppingModelMethod> _listMethods = [] ;
    _data.docs.forEach((element) {
     if(element.data()['wilayaSupport'].contains(wilaya)) {
       _listMethods.add(
           ShoppingModelMethod.fromJson(
             //Map<String, dynamic>.from(element.data())
               {
                 'titleMethod': element.data()['titleMethod'],
                 'price': element.data()['price'],
                 'wilayaSupport': List<String>.from(
                     element.data()['wilayaSupport'])
               }
           )
       );
     }
    });

    return _listMethods ;






  }



}

//final getMethodListShoppin = GetMethodShopping() ;