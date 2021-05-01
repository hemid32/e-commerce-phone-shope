import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class SmailImageShoiColor extends StatelessWidget {
  const SmailImageShoiColor({
    Key key, this.image,
  }) : super(key: key);
  final String image ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0 , right: 10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0,10) ,
                color: kPrimaryColor.withOpacity(0.1) ,
                blurRadius: 50
            )
          ],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(image)
          )
      ),

    );
  }
}
