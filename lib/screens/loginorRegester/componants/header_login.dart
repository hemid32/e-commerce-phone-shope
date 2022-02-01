import 'package:flutter/material.dart';

class TextTileHeaderLogin extends StatelessWidget {
  const TextTileHeaderLogin({
    Key? key,required this.title,required this.details,required this.onTapBack,
  }) : super(key: key);
  final String title ;
  final String details ;
  final Function onTapBack ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){onTapBack();},
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 40 , left: 20 , right:  20 ),
            child: Icon(Icons.arrow_back , size: 30, color: Colors.white,),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 20 , left: 20 , right:  20 ),
          child: RichText(
              text: TextSpan(
                  text: '$title' ,
                  style:  Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
              )),
        ),
        Container(
          margin: EdgeInsets.only(top: 10 , left: 20 , right:  20 ),

          child: RichText(text: TextSpan(
              text: '$details' ,
              style:  Theme.of(context).textTheme.button?.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
          )),
        )
      ],
    );
  }
}

