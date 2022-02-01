import 'package:flutter/material.dart';

class TextBack extends StatelessWidget {
  const TextBack({
    Key? key,  this.onTap,required this.text,
  }) : super(key: key);
  final Function? onTap ;
  final String  text ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap!();},
      child: Container(
        margin: EdgeInsets.only(left: 20 , right:  20 , bottom:  20),
        alignment: Alignment.center,

        child: Text('$text' , style:  Theme.of(context).textTheme.button?.copyWith(
            decoration: TextDecoration.underline, color: Colors.black.withOpacity(0.4)
        ),),
      ),
    );
  }
}

