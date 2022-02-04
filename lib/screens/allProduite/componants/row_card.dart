import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/fatchAllData/bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc/bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc/state.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/model/filter/filterProduitFormProduitColor/model.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';

class CardRow extends StatelessWidget {
  CardRow({
    Key? key,required this.listProduitsWithPriority,required this.index, required this.length,
  }) : super(key: key);

  final  List<ProduitColorsWtithPreority> listProduitsWithPriority;
  final  int index ;
  final int length ;
  late List<int> i ;


  @override
  Widget build(BuildContext context) {
    i = claculerIndex() ;
    return Row(
      children: [
        i[0]==-1 ? Container() :BlocConsumer<BlocFavorite , StateFavorite >(
          listener: (context , state){},
          builder: (context, snp) {
            return FutureBuilder(
                //future:  FavoriteModelItem(produit: snapshot.produits[i[0]]).ifFavorite(),
              builder: (context, data) {
                print(BlocFavorite.get(context).listIdProduitColor) ;
                Produit produitShawing = FilterProduitFromProduitColors.getProduitsFromProduitColor(listProduitsWithPriority[i[0]].produitsColors, listProduitsWithPriority[i[0]].id.toString() ) ;
                print(produitShawing.id)  ;
                return   CardPhoneItems(
                  nombrePay: 0,
                  produit: produitShawing ,
                  pricintage: 00.0,//((snapshot.produits![i[0]].listProduits![0].price!*100) / snapshot.produits![i[0]].listProduits![0].priceOriginal!) ,
                  ///fav: false ,
                  onTap: (){
                    BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: listProduitsWithPriority[i[0]].id , produisColors: listProduitsWithPriority[i[0]].produitsColors )) ;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                      value: BlocProvider.of<BlocScreenDetailProduit>(context),
                      child:  DetailProduit() ,
                    )));} ,
                  //onTapFav:  (){} , // ()=> BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(snapshot.produits[i[0]])),
                  fav: BlocFavorite.get(context).listIdProduitColor.contains(listProduitsWithPriority[i[0]].produitsColors.id) ,//BlocFavorite.get(context).listIdFav.contains(ModelFaveriote(produitColors: produitsColor, idProduit: productShowing.id.toString())),
                  onTapFav: ()=> BlocFavorite.get(context).whenClickFavIcon(listProduitsWithPriority[i[0]].produitsColors, produitShawing.id.toString()),//BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(produitsColor)),

                );
              }
            );
          }
        ),
        i[1]==-1 ? Container() :  BlocConsumer<BlocFavorite , StateFavorite >(
          listener: (context , state){},
          builder: (context, snps) {
            return FutureBuilder(
                //future:  FavoriteModelItem(produit: snapshot.produits[i[1]]).ifFavorite(),
                builder: (context, datas) {
                  Produit produitShawing = FilterProduitFromProduitColors.getProduitsFromProduitColor(listProduitsWithPriority[i[1]].produitsColors, listProduitsWithPriority[i[1]].id.toString() ) ;
                  return CardPhoneItems(
                    nombrePay: 0,
                    produit: produitShawing ,//snapshot.produits![i[1]].listProduits![0] ,
                  pricintage: 0.0,//((snapshot.produits![i[1]].listProduits![0].price!*100) / snapshot.produits![i[1]].listProduits![0].priceOriginal!),
                  onTap: (){
                      BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: listProduitsWithPriority[i[1]].id , produisColors: listProduitsWithPriority[i[1]].produitsColors )) ;
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                        value: BlocProvider.of<BlocScreenDetailProduit>(context),
                        child:  DetailProduit() ,
                      )));} ,
                    //fav: false,//BlocFavorite.get(context).listIdProduitColor.contains(produitsColor.id) ,//BlocFavorite.get(context).listIdFav.contains(ModelFaveriote(produitColors: produitsColor, idProduit: productShowing.id.toString())),
                    //onTapFav: (){} ,//BlocFavorite.get(context).whenClickFavIcon(produitsColor, productShowing.id.toString()),//BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(produitsColor)),
//()=> BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(snapshot.produits[i[1]])),
                    fav: BlocFavorite.get(context).listIdProduitColor.contains(listProduitsWithPriority[i[1]].produitsColors.id) ,//BlocFavorite.get(context).listIdFav.contains(ModelFaveriote(produitColors: produitsColor, idProduit: productShowing.id.toString())),
                    onTapFav: ()=> BlocFavorite.get(context).whenClickFavIcon(listProduitsWithPriority[i[1]].produitsColors, produitShawing.id.toString()),//BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(produitsColor)),

                );
              }
            );
          }
        ),
      ],
    );
  }


  claculerIndex(){
    //print('index ======= $index') ;
    //print('lenth ======= $length ') ;
    List<int> getIndex  ;
    if(index ==0 )
      getIndex = [index , index +1 ] ;
    if(index == (length / 2).truncate().toInt() && index * 2 == length-1) {

      getIndex = [index * 2, -1];
    }
    else if(index *2 != length )
      getIndex = [index *2  , index *2+1] ;
    else
      getIndex = [-1 , -1] ;
    //print('getIndex ====$getIndex');
    return getIndex ;
  }

}

