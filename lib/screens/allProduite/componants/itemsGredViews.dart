import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/bloc/fatchAllData/bloc.dart';
import 'package:phoneshop/bloc/fatchAllData/state.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/allProduite/componants/row_card.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';

import 'container_vide.dart';

class ItemsGredViews extends StatelessWidget {
  const ItemsGredViews({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     print('all') ;
    return Container(
      child: BlocConsumer<BlocFatchData ,  StateFatchData>(
        listener: (context , state){},
        builder: (context, snapshot) {
          //print('==================== **** ${BlocFatchData.get(context).listProduitColorsFatchAll}') ;
          if(BlocFatchData.get(context).showAllFromScreenAllProducts.isEmpty  ) return Align(alignment: Alignment.center, child: ContainerProduitSearchVide()) ; else
          return Column(
            children: [
              for (var i = 0; i <= (BlocFatchData.get(context).showAllFromScreenAllProducts.length /2 ).truncate().toInt(); i++)
                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: CardRow(
                    listProduitsWithPriority:BlocFatchData.get(context).showAllFromScreenAllProducts ,//ListProduitsColors(produits: BlocFatchData.get(context).showAllFromScreenAllProducts),
                    index: i,
                    length: BlocFatchData.get(context).showAllFromScreenAllProducts.length,
                  ),
                ),
            ],

          );
        }
      ),
    );
  }
}

