import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/fatchAllData/state.dart';
import 'package:phoneshop/model/getModelFirebase/getTotalProduitColors.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class BlocFatchData extends Cubit<StateFatchData> {
  BlocFatchData() : super(StateFatchDataInitState());

  static BlocFatchData get(context) => BlocProvider.of(context);
  final GetProduitTotalFromFirebas _produit = new GetProduitTotalFromFirebas();

  List<ProduitsColors> listProduitColorsFatchAll = [];
  List<ProduitsColors> listProduitColorsTheBestProduct = [];

  // this variable using from screen  show all
  List<ProduitColorsWtithPreority> showAllFromScreenAllProducts = [];

  //logo type phone from screen all
  String logo = 'assets/icons/icon1.svg' ;
  changeLogo(String logoNew){
    logo = logoNew ;
    emit(StateFatchDataIniGetTheCahngeLodo()) ;

  }

  //get data from fire base
  void getDataProduitCoolorFromFireBase() async {
    final ListProduitsColors _totalProduit =
        await _produit.getListProduitsColorsObject();
    listProduitColorsFatchAll = _totalProduit.produits!;
    listProduitColorsTheBestProduct = getTheBest();
    emit(StateFatchDataIniGetAllData());
  }

  //filter by the best
   getTheBest() {
    List<ProduitsColors> _produitColors = [] ;
    for(var poduitColor in  listProduitColorsFatchAll ){
      _produitColors.add(poduitColor) ;
    }
    _produitColors
        .sort((a, b) => (b.nombrePay!).compareTo(a.nombrePay!));
    return _produitColors ;
    //emit(StateFatchDataIniGetTheBest());
  }
  //filter by the recent

  // show all
  // targer == 'best' , 'Recent' , else => mode_product'
  void showAllDataFronScreenAll(String target) {
    print('fatch data target === $target') ;
    print('listProduitColorsTheBestProduct lentg == ${listProduitColorsTheBestProduct.length}') ;
    showAllFromScreenAllProducts.clear() ;
    if (target == 'best') {
      listProduitColorsTheBestProduct.forEach((element) {
        showAllFromScreenAllProducts.add(ProduitColorsWtithPreority(
            produitsColors: element,
            id: _getProduitColorWithProduitPreorityContitue(element)));
      });
    } else if (target == 'Recent') {
      listProduitColorsFatchAll.forEach((element) {
        showAllFromScreenAllProducts.add(ProduitColorsWtithPreority(
            produitsColors: element,
            id: _getProduitColorWithProduitPreorityContitue(element)));
      });
    } else {
      for (var produitColor in listProduitColorsFatchAll) {
        if (produitColor.typePhone == target) {
          showAllFromScreenAllProducts.add(ProduitColorsWtithPreority(
              produitsColors: produitColor,
              id: _getProduitColorWithProduitPreorityContitue(produitColor)));
        }
      }
    }
    emit(StateFatchDataIniGetAllShow());
  }





  // propriety default
  int _getProduitColorWithProduitPreorityContitue(
      ProduitsColors produitsColors) {
    List<Produit> newList = [];
    //priority 1
    Produit produitPriority;
    for (var produit in produitsColors.listProduits!) {
      if (produit.contitu != 0) newList.add(produit);
    }
    //priority 3
    if (newList.isEmpty) {
      produitPriority = produitsColors.listProduits![0];
    } else {
      // priority 2
      newList.sort((a, b) => (a.contitu)!.compareTo(b.contitu!));
      produitPriority = newList[0];
    }
    return produitPriority.id!;
  }
  // filter produits by ram storage ...ect

  // ram
  int _getProduitColorWithProduitPreorityRam(
      ProduitsColors produitsColors) {
    List<Produit> listProduit = produitsColors.listProduits! ;
    listProduit.sort((a, b) => (a.ram)!.compareTo(b.ram!));
    Produit  produitPriority = listProduit[0];
    return produitPriority.id!;
  }
   // storage
  int _getProduitColorWithProduitPreorityStorage(
      ProduitsColors produitsColors) {
    List<Produit> listProduit = produitsColors.listProduits! ;
    listProduit.sort((a, b) => (a.storage)!.compareTo(b.storage!));
    Produit  produitPriority = listProduit[0];
    return produitPriority.id!;
  }


  //price
  int _getProduitColorWithProduitPreorityPrice(
      ProduitsColors produitsColors) {
    List<Produit> listProduit = produitsColors.listProduits! ;
    listProduit.sort((a, b) => (a.price)!.compareTo(b.price!));
    Produit  produitPriority = listProduit[0];
    return produitPriority.id!;
  }







}

class ProduitColorsWtithPreority {
  final ProduitsColors produitsColors;
  final int id;
  ProduitColorsWtithPreority({required this.produitsColors, required this.id});
}
