
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/search/bloc.dart';
import 'package:phoneshop/bloc/search/event.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/screens/screen_pay/componants/field_text.dart';

import 'textFeild_and_search_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<BlocEventSearch>(context).add(EventListSearch('s'));

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
                      ListTile(title: Text(snapshot.produits == null ? '' : snapshot.produits[i].nomPhone),)
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

