import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/constant.dart';

class SmailImageShoiColor extends StatelessWidget {
  const SmailImageShoiColor({
    Key key, this.image, this.onTap, this.index = 0 ,
  }) : super(key: key);
  final String image ;
  final Function onTap ;
  final int index  ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<BlocScreenDetailProduit, List<dynamic>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(left: 0 , right: 10),
            height:  !(index == state[2]) ? 60 : 65 ,
            width: !(index == state[2]) ? 60 : 65,
            decoration: BoxDecoration(
                border: Border.all(color: !(index == state[2]) ?  Colors.black.withOpacity(0.2) : kPrimaryColor ,

                width: !(index == state[2]) ?  2 :  3
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0,10) ,
                      color:  kPrimaryColor.withOpacity(0.1) ,
                      blurRadius: 50 ,

                  )
                ],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(image)
                )
            ),

          );
        }
      ),
    );
  }
}
