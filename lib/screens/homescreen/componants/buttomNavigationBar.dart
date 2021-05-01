import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class BottomNavigationsBars extends StatelessWidget {
  const BottomNavigationsBars({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20 ),
      width:  MediaQuery.of(context).size.width,
      height:  50,
      decoration:  BoxDecoration(
        color: Colors.white ,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(Icons.home , size:  30, color: kPrimaryColor, ) ,
              Container(
                height: 2,
                width: 15,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.rectangle
                ),
              )
            ],
          ) ,
          Column(
            children: [
              Icon(Icons.favorite , size:  30, color: Colors.black.withOpacity(0.23),) ,
              Container(
                height: 2,
                width: 15,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle
                ),
              )
            ],
          ),
          Column(
            children: [
              Icon(Icons.shopping_cart , size:  30, color: Colors.black.withOpacity(0.23),) ,
              Container(
                height: 2,
                width: 15,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle
                ),
              )
            ],
          ) ,
          Column(
            children: [
              Icon(Icons.person , size:  30,color: Colors.black.withOpacity(0.23), ) ,
              Container(
                height: 2,
                width: 15,
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
