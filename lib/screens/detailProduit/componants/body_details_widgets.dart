import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/constant.dart';

import 'containet_ram_storage_spu.dart';
import 'description.dart';
import 'items_colors_shoise.dart';
import 'row_price_and_minus_add_contitus.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({
    Key key, @required this.price, @required this.title, this.priceOld,
  }) : super(key: key);
  final double price ;
  final String title ;
  final double priceOld ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding  , vertical:  kDefaultPadding*2),
      //width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20) ,
            topLeft: Radius.circular(20) ,
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          BlocBuilder<BlocScreenDetailProduit, List<dynamic>>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( '${state[0].nomPhone } ' , style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.5) ) ) ,
                  SizedBox(height: kDefaultPadding/2,) ,
                  RowPriceANDContitus(price: state[0].price, priceOld: state[0].priceOriginal) ,
                ],
              );
            }
          ),


          SizedBox(height: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text( 'Choose a color' , style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.5) ) ) ,
              Divider() ,
              SizedBox(height: 15,),
              ItemsColorShoise(),


            ],
          ),
          SizedBox(height: 20,),

          BlocBuilder<BlocScreenDetailProduit, List<dynamic>>(
            builder: (context, state) {
              return ContainerRamStockagColors(
                spu: state[0].spu,
                ram:  state[0].ram,
                stockag:  state[0].storage,
              );
            }
          ),

          BlocBuilder<BlocScreenDetailProduit, List<dynamic>>(
            builder: (context, state) {
              return DescriptionProduit(description: state[0].detail,);
            }
          ) ,









        ],
      ),
    );
  }
}

