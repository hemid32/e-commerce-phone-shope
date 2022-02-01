import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/constant.dart';

class TextAndLogo extends StatelessWidget {
  const TextAndLogo({
    Key? key,required this.title,required this.logo,
  }) : super(key: key);
  final String title ;
  final String logo ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding , vertical: kDefaultPadding/2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(


              alignment: Alignment.centerLeft,
              child: Text('$title ' , style:  Theme.of(context).textTheme.button?.copyWith(fontSize: 20),)),
          Spacer() ,

          Container(

            height:  70,
            width:  70,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle ,
            ),

            child: SvgPicture.asset(logo ,),
          ),
        ],
      ),
    );
  }
}
