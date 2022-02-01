import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class HeaderSetting extends StatelessWidget {
  const HeaderSetting({
    Key? key, required this.titre,
  }) : super(key: key);
  final String titre ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
      alignment: Alignment.bottomLeft,
      height: 100,
      width: double.infinity,
      color: kPrimaryColor.withOpacity(0.7),
      child: Text('$titre' , style :  Theme.of(context).textTheme.button?.copyWith(
          fontSize:  20 ,
          color: Colors.white
      )),
    );
  }
}

