
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class GetProduitTotalFromFirebas {




  Future <ListProduitsColors> getListProduitsColorsObject() async  {
    List<ProduitsColors> _listProduitsColors= [] ;
    List<Map<String , dynamic>> _data =  await getLiistProduitColorsFromFireBase() ;

    _data.forEach((element) {
      List<Produit>  _listProduits = [] ;
      element['listProduits'].forEach((elemntsProduit){
        if(elemntsProduit['contitu']>1) {
          _listProduits.add(
              Produit.formJson({
                'image': elemntsProduit['image'],
                'nomPhone': elemntsProduit['nomPhone'],
                'detail': elemntsProduit['detail'],
                'phoneType': elemntsProduit['phoneType'],
                'ram': elemntsProduit['ram'],
                'storage': elemntsProduit['storage'],
                'contitu': elemntsProduit['contitu'],
                'price': elemntsProduit['price'] + .0,
                'priceOriginal': elemntsProduit['priceOriginal'] + .0,
                'spu': elemntsProduit['spu'],
                'id': elemntsProduit['id'],
                'camera': elemntsProduit['camera']
              }));
        }
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
      if(_produit.listProduits!.length>0 )
      _listProduitsColors.add(_produit) ;
    });
    ListProduitsColors _resul = ListProduitsColors.fronJson({
      'produits' : _listProduitsColors ,
    });

    return _resul ;

  }

  getLiistProduitColorsFromFireBase() async  {
    final    document = await  FirebaseFirestore.instance.collection('Produits');
    var _data =  await document.get() ;
    //_InternalLinkedHashMap<String, dynamic> to Map<String,dynamic> == try ==> Map<String, dynamic>.from(yourData)
    List<Map<String , dynamic>> _listData = [] ;
    _data.docs.forEach((element) {
      _listData.add(Map<String, dynamic>.from(element.data())) ;
    });
    //print('data from fire base ===== $_listData');
     return  _listData   ; //_listData=[{...} , {....}];
  }


  nombreProduitFromFireBase(String idProduitColor ,int  idProduit) async  {
    final    produitColor =   FirebaseFirestore.instance.collection('Produits').where('id' , isEqualTo: idProduitColor);
    var _data =  await produitColor.get() ;
   Map<String , dynamic> _listData =  _data.docs[0].data() ;
    /*
    _data.docs.forEach((element) {
      _listData.add(Map<String, dynamic>.from(element.data())) ;
    });

     */
    //ProduitsColors _produit = ProduitsColors()

    Map<String , dynamic> produitWhirId = _listData['listProduits'][idProduit-1] ;
    int contitu = produitWhirId['contitu'] ;
    return contitu ;

    //print() ;

  }



   getProduitColorsWithId(String id) async  {
      ListProduitsColors listProduitColors  =await  getListProduitsColorsObject() ;
      for(var i in listProduitColors.produits!){
        if(i.id == id)
          return i ;
      }
      return null ;

    }







}


