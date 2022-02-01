import 'package:phoneshop/model/produit/produit_colors.dart';

class FilterFromAllProduits  {

  final double price ;
  final double ram ;
  final double storage ;
  final  double camera ;
  final ListProduitsColors? produitsColors ;

  FilterFromAllProduits({this.price = 500, this.ram = 2, this.storage = 0 , this.camera = 8 , this.produitsColors});

  filter(){
    List<ProduitsColors>  _listProduit = [] ;
    produitsColors!.produits?.forEach((element) {
      if(ram<= element.listProduits![0].ram! && storage <= element.listProduits![0].storage! && price<= element.listProduits![0].price! && camera <= element.listProduits![0].camera!  )
        _listProduit.add(element) ;
    });
    ListProduitsColors _resulFilter = ListProduitsColors.fronJson({
      'produits' : _listProduit ,
    });


    return _resulFilter ;


  }






}