import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/event.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/bloc.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/event.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/bloc/manageScreen/home/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/home/events.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/model/produit/servises.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/button_waith_80.dart';
import 'package:phoneshop/screens/homescreen/componants/card_phone_favorite.dart';
import 'package:phoneshop/screens/homescreen/componants/conainer_favorite_is_vide.dart';
import 'package:phoneshop/screens/homescreen/componants/favorite_header.dart';
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
      child: BlocBuilder<BlocFavoriteList , ListProduitsColors>(
        builder: (context, snapshot) {
          return  FutureBuilder(
            builder: (context, data) {
              return snapshot.produits == null  ? Container() :  Column(
                children: [
                  SearchAndIconMenu() ,
                  //HeaderFavorite() ,
                  SizedBox(height: 20,) ,

                   for(var i =0 ; i< snapshot.produits.length ; i++)  CardPhoneChopeFavorite(
                    onTap: (){
                      BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: 0 , produisColors: snapshot.produits[i] )) ;
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                        value: BlocProvider.of<BlocScreenDetailProduit>(context),
                        child:  BlocProvider.value(
                            value: BlocProvider.of<BlocUserVerifaid>(context),
                            child: DetailProduit()) ,
                      )));
                    },
                    image: snapshot.produits[i].listProduits[0].image,
                    title: snapshot.produits[i].listProduits[0].nomPhone,
                    detail:snapshot.produits[i].listProduits[0].detail,
                    ram: snapshot.produits[i].listProduits[0].ram,
                    storage: snapshot.produits[i].listProduits[0].storage,
                    contitu: snapshot.produits[i].listProduits[0].contitu,
                    price: snapshot.produits[i].listProduits[0].price,
                    deletCard: (){
                      BlocProvider.of<BlocFavoriteIs>(context)
                          .add(IsTapOnFavEvent(snapshot.produits[i] ));

                      BlocProvider.of<BlocFavoriteList>(context)
                        .add(EventListItemsFavoriteDeleteItems(produit: snapshot.produits[i]));

                      },
                  ) ,
                  snapshot.produits.length == 0 ? ContainerFavVide(): SizedBox() ,

                ],

              );
            }
          );
        }
      ),
    );
  }
}

