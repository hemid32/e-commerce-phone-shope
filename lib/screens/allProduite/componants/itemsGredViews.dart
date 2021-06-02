import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/bloc.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
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
          return Column(
            children: [
              for (var i = 0; i < (snapshot.produits.length); i++)
                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardPhoneItems(
                        title: '${snapshot.produits[i].listProduits[0].nomPhone}',
                        price: snapshot.produits[i].listProduits[0].price,
                        descreption: snapshot.produits[i].listProduits[0].detail,
                        image:snapshot.produits[i].listProduits[0].image ,
                        pricintage: 20,
                      ),
                      CardPhoneItems(
                        title: '${snapshot.produits[i ].listProduits[0].nomPhone} ${i+ 20/2 }',
                        price: 50000,
                        descreption: 'hemddv v dvdfv dvdf vdf vdfv ',
                        image:
                        'assets/images/samsung-galaxy-s8-4g-smartphone-png-favpng-qNm18RuFag7316FekDYk0Pqy4.jpg',
                        pricintage: 20,
                      ),
                    ],
                  ),
                ),
            ],

          );
        }
      ),
    );
  }
}

