
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/bloc/search/bloc.dart';
import 'package:phoneshop/bloc/search/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';
import 'package:phoneshop/screens/search/componants/card_phon_search.dart';

import 'textFeild_and_search_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<BlocEventSearch>(context).add(EventListSearch('s'));

    Size size = MediaQuery.of(context).size ;

    return SingleChildScrollView(
      child: Column(
        children: [
          FieldTextAndIconSearch()  ,

          BlocBuilder<BlocEventSearch , ListProduitsColors>(
            builder: (context, snapshot) {
              return Container(
                child: Column(
                  children: [
                    for(var i =0 ; i<  (snapshot.produits == null ? 0 :  snapshot.produits.length) ; i++)
                      //ListTile(title: Text(snapshot.produits == null ? '' : snapshot.produits[i].nomPhone),)
                      CardPhoneSearsh(
                        storage: snapshot.produits[i].listProduits[0].storage.toString(),
                        ram: snapshot.produits[i].listProduits[0].ram.toString() ,
                        image: snapshot.produits[i].listProduits[0].image,
                        title: snapshot.produits[i].nomPhone,
                        price: snapshot.produits[i].listProduits[0].price.toString(),
                        onTap: (){
                          BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: 0 , produisColors: snapshot.produits[i] )) ;
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                            value: BlocProvider.of<BlocScreenDetailProduit>(context),
                            child:  DetailProduit() ,
                          )));
                        },
                      )
                  ],
                ),
              );
            }
          )

        ],
      ),
    );
  }
}

