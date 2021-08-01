import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ImageUser extends StatelessWidget {
  const ImageUser({
    Key key, this.imageCurrent, this.onTap,
  }) : super(key: key);
  final String imageCurrent ;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 130,
        child: Stack(
          children: [
            Container(
              width: 120,
              height:120,
              decoration: BoxDecoration(
                  color: Colors.red ,
                  shape: BoxShape.circle ,
                  image: DecorationImage(
                      image: AssetImage(
                          '$imageCurrent'
                      ) ,
                      fit: BoxFit.cover
                  )
              ),
            ),
            Positioned(
              bottom: 5,
              right:5,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white , width: 4) ,
                    color: kPrimaryColor ,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.edit , size: 20, color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

