import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc/bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc/state.dart';
import 'package:phoneshop/bloc/favorite/event.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/bloc.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/event.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/events.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/favorite/servises.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/model/produit/servises.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/button_waith_80.dart';
import 'package:phoneshop/screens/homescreen/componants/card_phone_favorite.dart';
import 'package:phoneshop/screens/homescreen/componants/conainer_favorite_is_vide.dart';
import 'package:phoneshop/screens/homescreen/componants/favorite_header.dart';
import 'package:phoneshop/screens/homescreen/componants/header_setting.dart';
import 'package:phoneshop/screens/homescreen/componants/search_and_icon_menu.dart';
import 'package:phoneshop/screens/search/search_screen.dart';

class Favorite extends StatelessWidget {
  const Favorite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Container(
      //color: kPrimaryColor.withOpacity(0.23),
      child: BlocConsumer<BlocFavorite , StateFavorite>(
        listener: (context, state){},
        builder: (context, snapshot) {
          return  FutureBuilder(
            builder: (context, state) {
              return BlocFavorite.get(context).listFav.isEmpty  ? Container() :  Column(
                children: [
                  //SearchAndIconMenu() ,
                  //HeaderFavorite() ,
                  HeaderSetting(titre:  'Favorite',) ,

                  SizedBox(height: 20,) ,

                   for(var itemFavorite  in BlocFavorite.get(context).listFav )  Builder(
                     builder: (context) {
                       Produit produit = ServisesFavoriteHive.getProduitFromProduitIndex(itemFavorite.produitColors, itemFavorite.idProduit) ;
                       return CardPhoneChopeFavorite(
                        onTap: (){
                          BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: int.parse(itemFavorite.idProduit) , produisColors: itemFavorite.produitColors )) ;
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                            value: BlocProvider.of<BlocScreenDetailProduit>(context),
                            child:  BlocProvider.value(
                                value: BlocProvider.of<BlocUserVerifaid>(context),
                                child: DetailProduit()) ,
                          )));
                        },
                        produit: produit,
                        deletCard: (){
                          /*
                          BlocProvider.of<BlocFavoriteIs>(context)
                              .add(IsTapOnFavEvent(snapshot.produits[i] ));

                          BlocProvider.of<BlocFavoriteList>(context)
                            .add(EventListItemsFavoriteDeleteItems(produit: snapshot.produits[i]));

                           */
                          BlocFavorite.get(context).deletFav(itemFavorite) ;

                          },
                  );
                     }
                   ) ,
                  BlocFavorite.get(context).listFav.isEmpty ? ContainerFavVide(): SizedBox() ,

                ],

              );
            }
          );
        }
      ),
    );
  }
}

