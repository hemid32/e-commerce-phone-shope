import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/allProduite/componants/row_card.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';

class ItemsGredViews extends StatelessWidget {
  const ItemsGredViews({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: BlocBuilder<BlocAllProduitFilter ,  ListProduitsColors>(
        builder: (context, snapshot) {
          //print('snapshot.produits.length ===') ;
          if(snapshot.produits == null ) return CircularProgressIndicator() ; else
          return Column(
            children: [
              for (var i = 0; i <= (snapshot.produits.length /2 ).truncate().toInt(); i++)
                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: CardRow(
                    snapshot: snapshot,
                    index: i,
                    length: snapshot.produits.length,
                  ),
                ),
            ],

          );
        }
      ),
    );
  }
}

