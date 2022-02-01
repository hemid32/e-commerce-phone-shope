import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ImageUser extends StatelessWidget {
  const ImageUser({
    Key? key,required this.image,
  }) : super(key: key);
  final String image ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Container(
      width: size.width *0.3,
      height:  size.width *0.3,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border.all(color: Colors.black) ,
          shape: BoxShape.circle ,
          image: DecorationImage(
              image: AssetImage(
                '$image' ,

              ),

              fit: BoxFit.contain
          )
      ),

    );
  }
}



