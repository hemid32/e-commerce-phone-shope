import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';

import 'smail_image_shois_color.dart';

class ItemsColorShoise extends StatelessWidget {
  const ItemsColorShoise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //for(var i = 0 ; i< BlocProvider.of<BlocScreenDetailProduit>(context).state[1].listProduits.length ; i++ ) SmailImageShoiColor(
          for(var i in  BlocProvider.of<BlocScreenDetailProduit>(context).state[1].listProduits) SmailImageShoiColor(
            image: i.image ,
            index: i.id,
            onTap: (){
              BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(
                indexProduit: i.id ,
                produisColors: BlocProvider.of<BlocScreenDetailProduit>(context).state[1] ,
              ));
              BlocProvider.of<BlocMinusAddProduitFromDetail>(context).add(EventMinus(
                totalProduit: i.contitu ,
                courentContitu: 1
              ));
            },
          ),
        ],
      ),
    );
  }
}

