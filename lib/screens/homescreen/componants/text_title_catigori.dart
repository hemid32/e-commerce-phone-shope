import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class TextTileCatigori extends StatelessWidget {
  const TextTileCatigori({
    Key? key,required this.title,
  }) : super(key: key);
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top:  20  , left:  kDefaultPadding),
      alignment: Alignment.centerLeft,
      child: Text('$title' , style:  Theme.of(context).textTheme.button?.copyWith(fontSize:  20 ),),
    );
  }
}
