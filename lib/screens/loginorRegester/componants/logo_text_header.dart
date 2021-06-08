import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextTileHeader extends StatelessWidget {
  const TextTileHeader({
    Key key, this.logo, this.title, this.details,
  }) : super(key: key);
  final String logo ;
  final String title ;
  final String details ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 40 , left: 20 , right:  20 ),
          child: SvgPicture.asset('$logo', width: 60,),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10 , left: 20 , right:  20 ),
          child: RichText(
              text: TextSpan(
              text: '$title' ,
              style:  Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
          )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10 , left: 20 , right:  20 ),

          child: RichText(text: TextSpan(
              text: '$details' ,
              style:  Theme.of(context).textTheme.button.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
          )),
        )
      ],
    );
  }
}

