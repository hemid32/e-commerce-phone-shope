import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/constant.dart';

import 'containet_ram_storage_spu.dart';
import 'description.dart';
import 'items_colors_shoise.dart';
import 'row_price_and_minus_add_contitus.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({
    Key? key, required this.price, required this.title, this.priceOld,
  }) : super(key: key);
  final double price ;
  final String title ;
  final double? priceOld ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding  , vertical:  kDefaultPadding*2),
      //width: size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
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
                  Text( '${state[0].nomPhone } ' , style: Theme.of(context).textTheme.button?.copyWith(fontSize: 20 ) ) ,
                  SizedBox(height: kDefaultPadding/2,) ,
                  RowPriceANDContitus(price: state[0].price, priceOld: state[0].priceOriginal ,contitu: state[0].contitu ,) ,
                ],
              );
            }

          ),


          SizedBox(height: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text( 'Choose a color' , style: Theme.of(context).textTheme.button?.copyWith(fontSize: 20  ) ) ,
              Divider() ,
              SizedBox(height: 15,),
              ItemsColorShoise(),


            ],
          ),
          SizedBox(height: 20,),

          BlocBuilder<BlocScreenDetailProduit, List<dynamic>>(
            builder: (context, state) {
              return Column(
                children: [
                  ContainerRamStockagColors(
                    spu: state[0].spu,
                    ram:  state[0].ram,
                    stockag:  state[0].storage,
                    camera: state[0].camera,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child : Row(
                      children: [
                        //Icon(Icons.aspect_ratio, color: Colors.black.withOpacity(0.3),) ,
                        SvgPicture.asset('assets/icons/processor.svg', width: 30, height: 30, color: Theme.of(context).iconTheme.color,) ,
                        SizedBox(width: 10,) ,
                        Text('SPU : ' ,  style: Theme.of(context).textTheme.button) ,
                        Expanded(child: Text('${state[0].spu}' , style:  Theme.of(context).textTheme.button,))
                      ],
                    ) ,

                  )
                ],
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

