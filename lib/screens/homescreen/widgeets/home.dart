import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/event.dart';
import 'package:phoneshop/model/getModelFirebase/getTotalProduitColors.dart';
import 'package:phoneshop/model/getModelFirebase/theBestProduit/model.dart';
import 'package:phoneshop/model/produit/servises.dart';
import 'package:phoneshop/screens/allProduite/all_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/bestSalling_see_All.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';
import 'package:phoneshop/screens/homescreen/componants/itemsMenu.dart';
import 'package:phoneshop/screens/homescreen/componants/search_and_icon_menu.dart';
import 'package:phoneshop/screens/homescreen/componants/text_title_catigori.dart';

class Home extends StatelessWidget {
   Home({
    Key key,
  }) : super(key: key);

   GetTheBestProduits _getData = new  GetTheBestProduits() ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchAndIconMenu() ,
        TextTileCatigori(title: 'Catigories',) ,
        ItemsMenu() ,
        SizedBox(height: 20,) ,
        RowTextBestSalingAndSeeAll(
            title:  'Best Selling',
            suptitle:  'See all',
            onTap:  (){
          BlocProvider.of<BlocAllProduitFilter>(context).add(EventAllProduitTheBest());
          Navigator.push(context, MaterialPageRoute(builder: (contex) =>BlocProvider.value(
            value: BlocProvider.of<BlocAllProduitFilter>(context),
            child :  AllProduit()

          ) ));

        }) ,

        FutureBuilder(
            future: _getData.getTheBestProduit()  ,
            builder: (context , snapShot){
              print('datat home === ${snapShot.data}') ;
              if(!snapShot.hasData) return CircularProgressIndicator() ; else
              return ItemsCardBestSellingPHone(listData: snapShot.data,)  ;

        }) ,

        ItemsCardBestSellingPHone(listData: getProduitColors(),) ,
        TextTileCatigori(title: 'Cuts',) ,
        ItemsCardBestSellingPHone(listData: getProduitColors(),) ,










      ],
    );
  }
}

