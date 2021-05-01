

import 'package:flutter/material.dart';

import 'body_details_widgets.dart';
import 'header_detail.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderDetail() ,
          BodyDetail(title: 'Samsung Gtx 23' , price:  500, priceOld:  600,),

          /*
          Expanded(
            child: Stack(
              children: [

                Positioned(
                  top: 0,
                  child: ImageProduite(image: 'assets/images/iphone-x-samsung-galaxy-s8-iphone-7-smartphone-png-favpng-7ke4DBbj5kLrbQftMD6XuN56h.jpg' ,),

                ),
                Positioned(
                  top: kDefaultPadding *2,
                  right:  kDefaultPadding,


                  child: SmailCardCircleIconRed(icon:  Icon(Icons.shopping_cart),),
                ),
                Positioned(
                  top: kDefaultPadding *2,
                  left:  kDefaultPadding,


                  child: SmailCardCircleIconRed(activeRed: false , icon:  Icon(Icons.menu),),
                ),

                Positioned(
                  top:size.height *0.4 - 10 ,
                  //bottom: 0,
                  child: BodyDetail(title: 'Samsung Gtx 23' , price:  500, priceOld:  600,),
                )
              ],
            ),
          ),

           */
        ],
      ),
    );

  }
}

