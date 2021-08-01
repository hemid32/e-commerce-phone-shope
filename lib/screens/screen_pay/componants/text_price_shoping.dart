import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class TextPriceShoping extends StatelessWidget {
  const TextPriceShoping({
    Key key, this.title, this.price,
  }) : super(key: key);
  final String title ;
  final double price  ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      child: Row(
        children: [
          //TitleTextAligns(title: 'La Some',) ,
          Text('$title' , style:  Theme.of(context).textTheme.button.copyWith( fontSize:  15),) ,
          Spacer() ,
          Text('$price DZ', style:  Theme.of(context).textTheme.button,)
        ],
      ),
    );
  }
}


