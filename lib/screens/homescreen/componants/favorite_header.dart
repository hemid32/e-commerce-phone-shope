import 'package:flutter/material.dart';

class HeaderFavorite extends StatelessWidget {
  const HeaderFavorite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //TextTileCatigori(title: 'Favorite List',),
          Text('List Favorite ' ,style: Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color: Colors.black.withOpacity(0.6)),) ,
          Spacer() ,
          Icon(Icons.favorite , color: Colors.red.withOpacity(0.4),size: 40,)
        ],
      ),
    );
  }
}

