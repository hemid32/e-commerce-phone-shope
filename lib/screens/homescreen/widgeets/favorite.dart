import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/event.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/bloc.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/homescreen/componants/card_phone_favorite.dart';
import 'package:phoneshop/screens/homescreen/componants/favorite_header.dart';
import 'package:phoneshop/screens/homescreen/componants/search_and_icon_menu.dart';

class Favorite extends StatelessWidget {
  const Favorite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: kPrimaryColor.withOpacity(0.23),
      child: BlocBuilder<BlocFavoriteList , ListProduitsColors>(
        builder: (context, snapshot) {
          return Column(
            children: [
              SearchAndIconMenu() ,
              //HeaderFavorite() ,
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider()) ,
              for(var i =0 ; i< snapshot.produits.length ; i++)  CardPhoneChopeFavorite(
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
              )

            ],

          );
        }
      ),
    );
  }
}

