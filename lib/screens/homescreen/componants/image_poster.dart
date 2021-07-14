import 'package:flutter/material.dart';

class ImagePoster extends StatelessWidget {
  const ImagePoster({
    Key key, this.image, this.onTap,
  }) : super(key: key);
  final String image  ;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height *0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10) ,
            image: DecorationImage(
                image: NetworkImage(
                    image ,

                ),
                fit: BoxFit.cover
            )

        ),
      ),
    );
  }
}
