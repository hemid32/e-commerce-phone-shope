import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/event.dart';
import 'package:phoneshop/bloc/fatchAllData/bloc.dart';
import 'package:phoneshop/bloc/fatchAllData/state.dart';
import 'package:phoneshop/model/getModelFirebase/theBestProduit/model.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/allProduite/all_produit.dart';
import 'package:phoneshop/screens/homescreen/componants/bestSalling_see_All.dart';
import 'package:phoneshop/screens/homescreen/componants/image_poster.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';
import 'package:phoneshop/screens/homescreen/componants/itemsMenu.dart';
import 'package:phoneshop/screens/homescreen/componants/search_and_icon_menu.dart';
import 'package:phoneshop/screens/homescreen/componants/text_title_catigori.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  //GetTheBestProduits _getData = new GetTheBestProduits();

  //ListProduitsColors _listShimmer = getProduitColors();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocFatchData , StateFatchData>(
      listener: (context , state){
        print('state =====> ${state.runtimeType }') ;
        if(state is StateFatchDataIniGetAllData) {
          //BlocFatchData.get(context).getTheBest() ;
          //BlocFatchData.get(context).getTheRecent() ;
        }
      },
      builder: (context, snapshot) {
        return Column(
          children: [
            SearchAndIconMenu(),
            TextTileCatigori(
              title: 'Catigories',
            ),
            ItemsMenu(),
            ImagePoster(
              image: 'https://thumbs.gfycat.com/KeyRashFossa-size_restricted.gif',
              onTap: (){},
            ),
            SizedBox(
              height: 20,
            ),
            RowTextBestSalingAndSeeAll(
                title: 'Best Selling',
                suptitle: 'See all',
                onTap: () {
                  
                  BlocFatchData.get(context).changeTarget('best') ;
                  BlocFatchData.get(context).showAllDataFronScreenAll() ;
                  BlocFatchData.get(context).changeLogo('assets/icons/best-offer.svg') ;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>  AllProduit()));
                }),

            FutureBuilder(
                //future: _getData.getTheBestProduit(),
                builder: (context, _) {
                  if (BlocFatchData.get(context).listProduitColorsTheBestProduct.isEmpty)
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0; i < 5; i++)
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    width:
                                        MediaQuery.of(context).size.width / 2 - 10,
                                    height: 310,
                                  ),
                                )
                            ],
                          ),
                        ));
                  else
                    return ItemsCardBestSellingPHone(
                      listData: ListProduitsColors(produits: BlocFatchData.get(context).listProduitColorsTheBestProduct),
                    );
                }),

            RowTextBestSalingAndSeeAll(
                title: 'Recent Offers',
                suptitle: 'See all',
                onTap: () {
                  BlocFatchData.get(context).changeTarget('Recent') ;
                  BlocFatchData.get(context).showAllDataFronScreenAll() ;
                  BlocFatchData.get(context).changeLogo('assets/icons/recent.svg') ;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>  AllProduit()));
                }),

            FutureBuilder(
                //future: _getData.getTheBestProduit(),
                builder: (context, snapShot) {
                  //print('datat home === ${snapShot.data}') ;
                  if (BlocFatchData.get(context).listProduitColorsFatchAll.isEmpty)
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0; i < 5; i++)
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    width:
                                        MediaQuery.of(context).size.width / 2 - 10,
                                    height: 310,
                                  ),
                                )
                            ],
                          ),
                        ));
                  else
                    return ItemsCardBestSellingPHone(
                      listData: ListProduitsColors(produits: BlocFatchData.get(context).listProduitColorsFatchAll),// snapShot.data!,
                    );
                }),

            //ItemsCardBestSellingPHone(listData: getProduitColors(),) ,
            //TextTileCatigori(title: 'Cuts',) ,
            //ItemsCardBestSellingPHone(listData: getProduitColors(),) ,
          ],
        );
      }
    );
  }
}

