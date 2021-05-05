import 'package:flutter/material.dart';
import 'package:phoneshop/screens/allProduite/all_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/bestSalling_see_All.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';
import 'package:phoneshop/screens/homescreen/componants/itemsMenu.dart';
import 'package:phoneshop/screens/homescreen/componants/search_and_icon_menu.dart';
import 'package:phoneshop/screens/homescreen/componants/text_title_catigori.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchAndIconMenu() ,
        TextTileCatigori(title: 'Catigories',) ,
        ItemsMenu() ,
        SizedBox(height: 20,) ,
        RowTextBestSalingAndSeeAll(title:  'Best Selling', suptitle:  'See all', onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (contex) =>AllProduit() )),) ,

        ItemsCardBestSellingPHone() ,
        TextTileCatigori(title: 'Cuts',) ,
        ItemsCardBestSellingPHone() ,










      ],
    );
  }
}

