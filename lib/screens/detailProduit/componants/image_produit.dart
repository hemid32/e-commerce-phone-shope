import 'package:flutter/material.dart';

class ImageProduite extends StatelessWidget {
  const ImageProduite({
    Key key, this.image,
  }) : super(key: key);
  final String image ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      height: size.height *0.4 ,
      width:  size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover ,
              alignment: Alignment.topCenter
          )
      ),

    );
  }
}

