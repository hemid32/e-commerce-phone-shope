import 'package:flutter/material.dart';

class TextTileAddress extends StatelessWidget {
  const TextTileAddress({
    Key key, this.title, this.details,
  }) : super(key: key);
  final String title ;
  final String details ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
      child: Row(
        children: [
          Text('$title : ', style: Theme.of(context).textTheme.button.copyWith(
              color: Colors.black.withOpacity(0.7) ,
              fontSize: 17
          ),),
          Expanded(
            child: Text('$details  ', style: Theme.of(context).textTheme.button.copyWith(
                color: Colors.black.withOpacity(0.5) ,
                fontSize: 15
            ),),
          ),

        ],
      ),
    );
  }
}

