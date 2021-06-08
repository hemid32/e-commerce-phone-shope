
import 'package:flutter/material.dart';

class CostomPath1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path() ;
    path.lineTo(0, size.height - 20 ) ;
    path.quadraticBezierTo(size.width *0.2, size.height , size.width *0.4, size.height );
    path.quadraticBezierTo(size.width *0.6, size.height - 40 , size.width *0.8, size.height  );
    path.quadraticBezierTo(size.width *0.9, size.height - 20 , size.width , size.height    );
    path.lineTo(size.width, 0)           ;
    return path ;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true ;
  }

}


class CostomPath2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path() ;
    //path.lineTo(0, -10 ) ;
    path.quadraticBezierTo(size.width *0.1, -10, size.width *0.25, 20 );
    path.quadraticBezierTo(size.width *0.4,  -20 , size.width *0.6, 20  );
    path.quadraticBezierTo(size.width *0.8,  -10, size.width * 0.9 , 20    );
    path.quadraticBezierTo(size.width *0.95,  -10, size.width +10 , 20    );
    path.lineTo(size.width, size.height)           ;
    path.lineTo(0, size.height)           ;

    return path ;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true ;
  }

}

class CostomPath3 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path() ;
    path.lineTo(0, 20 ) ;
    path.quadraticBezierTo(size.width *0.2, -20, size.width *0.3, 20 );
    path.quadraticBezierTo(size.width *0.4,  -10 , size.width *0.6, 30  );
    path.quadraticBezierTo(size.width *0.8,  -10, size.width * 0.9 , 20    );
    path.quadraticBezierTo(size.width *0.95,  -10, size.width +10 , 20    );
    path.lineTo(size.width, size.height)           ;
    path.lineTo(0, size.height )           ;

    return path ;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true ;
  }

}
