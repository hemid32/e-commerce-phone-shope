import 'package:flutter/material.dart';

class TextTileAddress extends StatelessWidget {
  const TextTileAddress({
    Key? key,required this.title,required this.details,
  }) : super(key: key);
  final String title ;
  final String details ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
      child: Row(
        children: [
          Text('$title : ', style: Theme.of(context).textTheme.button?.copyWith(

              fontSize: 17
          ),),
          Expanded(
            child: Text('$details  ', style: Theme.of(context).textTheme.button?.copyWith(

                fontSize: 15
            ),),
          ),

        ],
      ),
    );
  }
}

