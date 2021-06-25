
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class GetProduitTotalFromFirebas {




  Future <ListProduitsColors> addDataToObgets() async  {
    List<ProduitsColors> _listProduitsColors= [] ;
    List<Map<String , dynamic>> _data =  await getLiistProduitColorsFromFireBase() ;

    _data.forEach((element) {
      List<Produit>  _listProduits = [] ;
      element['listProduits'].forEach((elemntsProduit){
        _listProduits.add(Produit.formJson({
          'image' : elemntsProduit['image'] ,
          'nomPhone' : elemntsProduit['nomPhone'] ,
          'detail': elemntsProduit['detail'] ,
          'phoneType' :elemntsProduit['phoneType'] ,
          'ram' :elemntsProduit['ram'] ,
          'storage' : elemntsProduit['storage'] ,
          'contitu' :elemntsProduit['contitu']  ,
          'price' : elemntsProduit['price'] + .0  ,
          'priceOriginal' :elemntsProduit['priceOriginal'] + .0 ,
          'spu' : elemntsProduit['spu'] ,
          'id' :elemntsProduit['id'] ,
        })) ;
      });


      ProduitsColors _produit = ProduitsColors.fromJson({
        'id' : element['id'] ,
        'nomPhone': element['nomPhone'] ,
        'imagePosterPhone': element['imagePosterPhone'],
        'listProduits':  _listProduits , //getProsuits().produits,// produitses['produits'] ,
        'contitu' :element['contitu'],
        'nombrePay' :element['nombrePay'],
        'typePhone':element['typePhone'],
        'isFavorite' : false ,

      }) ;
      _listProduitsColors.add(_produit) ;
    });
    ListProduitsColors _resul = ListProduitsColors.fronJson({
      'produits' : _listProduitsColors ,
    });

    return _resul ;

  }

  getLiistProduitColorsFromFireBase() async  {
    final CollectionReference  document = await  FirebaseFirestore.instance.collection('Produits');
    var _data =  await document.get() ;
    //_InternalLinkedHashMap<String, dynamic> to Map<String,dynamic> == try ==> Map<String, dynamic>.from(yourData)
    List<Map<String , dynamic>> _listData = [] ;
    _data.docs.forEach((element) {
      _listData.add(Map<String, dynamic>.from(element.data())) ;
    });
    return  _listData  ; //_listData=[{...} , {....}];
  }







}


