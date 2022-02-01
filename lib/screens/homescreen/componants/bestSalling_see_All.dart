import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class RowTextBestSalingAndSeeAll extends StatelessWidget {
  const RowTextBestSalingAndSeeAll({
    Key? key,required this.title,required this.suptitle,required this.onTap,
  }) : super(key: key);
  final String title ;
  final String suptitle ;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          //TextTileCatigori(title: 'Best Salling',),
          Text(title, style:  Theme.of(context).textTheme.button?.copyWith(fontSize: 20),) ,
          Spacer() ,
          GestureDetector(

              onTap: (){onTap();},
              child: Text(suptitle , style: Theme.of(context).textTheme.button?.copyWith(color: Colors.black.withOpacity(0.3), fontSize: 20),))
        ],
      ),
    );
  }
}
