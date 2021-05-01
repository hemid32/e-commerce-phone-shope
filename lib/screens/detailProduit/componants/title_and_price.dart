import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

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
      width: size.width,
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

          Text( '$title ' , style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.5) ) ) ,
          SizedBox(height: kDefaultPadding/2,) ,
          RowPriceANDContitus(price: price, priceOld: priceOld) ,


          SizedBox(height: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text( 'Choose a color' , style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.5) ) ) ,
              SizedBox(height: 15,),
              ItemsColorShoise(),

            ],
          ),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 'Description' , style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.5) ) ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                text: '''
                Le Samsung Galaxy A12 est un smartphone entrée de gamme équipé d'un SoC Mediatek couplé à 3, 4 ou 6 Go de RAM et 32, 64 ou 128 Go de stockage, extensible via microSD. Il possède 4 capteurs photo à l'arrière : le principal à 48 mégapixels, un ultra grand-angle à 5 mégapixels, un objectif macro et un capteur de profondeur. Il a une batterie de 5000 mAh compatible charge rapide (15 W)
                ''' , 
                style:  Theme.of(context).textTheme.button.copyWith(color: kPrimaryColor.withOpacity(0.8) , fontSize: 15)
              ))
            ],
          ) ,









        ],
      ),
    );
  }
}

