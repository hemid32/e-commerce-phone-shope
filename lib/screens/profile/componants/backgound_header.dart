import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

import 'costom_path.dart';

class BakcgroundHerader extends StatelessWidget {
  const BakcgroundHerader({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      width: size.width,
      height: size.height *0.4,
      child: Stack(
        children: [
          ClipPath(
            clipper: CostomLiperPath1(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.4)

              ),
            ),
          ) ,
          ClipPath(
            clipper: CostomLiperPath2(),
            child: Container(
              width: size.width,
              height: size.height *0.4  ,
              decoration: BoxDecoration(
                color: kPrimaryColor ,
                //shape: BoxShape.circle ,
              ),

            ),
          ),

          Positioned(
            top: -50,
            right: -20,
            child: Container(
              width: size.height *0.3,
              height:  size.height *0.3 ,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2) ,
                shape: BoxShape.circle ,
              ),
            ),
          )

        ],
      ),
    );
  }
}
