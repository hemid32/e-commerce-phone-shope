import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/event.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/model/favorite/model.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';

class CardRow extends StatelessWidget {
  CardRow({
    Key key, this.snapshot, this.index, this.length,
  }) : super(key: key);

  final ListProduitsColors snapshot ;
  final  int index ;
  final int length ;
  List<int> i ;


  @override
  Widget build(BuildContext context) {
    i = claculerIndex() ;
    return Row(
      children: [
        i[0]==-1 ? Container() :BlocBuilder<BlocFavoriteIs , String >(
          builder: (context, snp) {
            return FutureBuilder(
                future:  FavoriteModelItem(produit: snapshot.produits[i[0]]).ifFavorite(),
              builder: (context, data) {
                return  data.hasData ?  CardPhoneItems(
                  title: '${snapshot.produits[i[0]].listProduits[0].nomPhone}',
                  price: snapshot.produits[i[0]].listProduits[0].price,
                  descreption: snapshot.produits[i[0]].listProduits[0].detail,
                  image:snapshot.produits[i[0]].listProduits[0].image ,
                  pricintage: ((snapshot.produits[i[0]].listProduits[0].price*100) / snapshot.produits[i[0]].listProduits[0].priceOriginal) ,
                  fav: data.data ,
                  onTap: (){
                    BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: 0 , produisColors: snapshot.produits[i[0]] )) ;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                      value: BlocProvider.of<BlocScreenDetailProduit>(context),
                      child:  DetailProduit() ,
                    )));} ,
                  onTapFav:   ()=> BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(snapshot.produits[i[0]])),
                ):Container();
              }
            );
          }
        ),
        i[1]==-1 ? Container() :  BlocBuilder<BlocFavoriteIs , String >(
          builder: (context, snps) {
            return FutureBuilder(
                future:  FavoriteModelItem(produit: snapshot.produits[i[1]]).ifFavorite(),
                builder: (context, datas) {
                  return datas.hasData ? CardPhoneItems(
                  title: '${snapshot.produits[i[1] ].listProduits[0].nomPhone} ',
                  price:  snapshot.produits[i[1]].listProduits[0].price,
                  descreption: snapshot.produits[i[1]].listProduits[0].detail,
                  image:  snapshot.produits[i[1]].listProduits[0].image ,
                  pricintage: ((snapshot.produits[i[1]].listProduits[0].price*100) / snapshot.produits[i[1]].listProduits[0].priceOriginal),
                  fav: datas.data ,
                  onTap: (){
                      BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: 0 , produisColors: snapshot.produits[i[1]] )) ;
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                        value: BlocProvider.of<BlocScreenDetailProduit>(context),
                        child:  DetailProduit() ,
                      )));} ,
                  onTapFav:   ()=> BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(snapshot.produits[i[1]])),

                ): Container();
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

