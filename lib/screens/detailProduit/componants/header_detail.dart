import 'package:flutter/material.dart';
import 'package:phoneshop/widgets/shaw_and_zoom_Image_details.dart';

import 'samail_circler_icon_red_isactiv.dart';

class HeaderDetail extends StatelessWidget {

  const HeaderDetail({
    Key? key, required  this.image,
  }) : super(key: key);

  final  String image ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return ClipPath(
      clipper: CostomP(),
      child: GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageViews(image: image,))),
        child: Container(
          alignment: Alignment.topCenter,
          height: size.height *0.4 ,
          width: size.width,
          decoration: BoxDecoration(
            //color: Colors.red ,
            image: DecorationImage(
                image: NetworkImage(
                  image ,

                ),
                fit: BoxFit.cover ,
                alignment: Alignment.topCenter
            ),


          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmailCardCircleIconRed(icon:  Icon(Icons.shopping_cart)) ,
                SmailCardCircleIconRed(icon:  Icon(Icons.share)  , activeRed: false,)  ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CostomP  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    Path path  =  Path() ;
    path.lineTo(0, size.height ) ;
    path.quadraticBezierTo(size.width/2, size.height-40 , size.width, size.height) ;
    path.lineTo(size.width, 0);
    path.close() ;

    return path  ;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false ;
  }


}

