

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/allProduite/all_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/bestSalling_see_All.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';
import 'package:phoneshop/screens/homescreen/componants/itemsMenu.dart';
import 'package:phoneshop/screens/homescreen/componants/search_and_icon_menu.dart';
import 'package:phoneshop/screens/homescreen/componants/text_title_catigori.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }
}

