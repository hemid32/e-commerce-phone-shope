import 'package:flutter/material.dart';

class CostomLiperPath1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path() ;
    path.lineTo(0, size.height -20) ;
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-20) ;
    path.lineTo(size.width, 0) ;
    return path ;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true ;
  }

}
class CostomLiperPath2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path() ;
    path.lineTo(0, size.height -20) ;
    path.quadraticBezierTo(size.width *0.35, size.height, size.width*0.4 , size.height -15 ) ;
    //path.lineTo(size.width, 0) ;
    path.quadraticBezierTo(size.width *0.8 , size.height /2 , size.width *0.6 , 0) ;

    return path ;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true ;
  }

}

