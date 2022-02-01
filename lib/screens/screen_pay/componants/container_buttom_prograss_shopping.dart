import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
class ContainetButtomPrograssShopping extends StatelessWidget {
  const ContainetButtomPrograssShopping({
    Key? key,required  this.icon
  }) : super(key: key);
  final IconData icon ;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.2) ,
        shape: BoxShape.circle ,
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle ,
        ),
        child: Icon(icon , size: 50 , color: Colors.white,),

      ),

    );
  }
}

