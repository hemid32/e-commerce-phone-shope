import 'package:flutter/material.dart';

class ButtonSizeWath80 extends StatelessWidget {
  const ButtonSizeWath80({
    Key key, this.title, this.onTap, this.color,
  }) : super(key: key);
  final String title ;
  final Function onTap ;
  final Color color ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width:size.width *0.8 ,
        height: 40,
        decoration: BoxDecoration(
          color: color ,
        ),
        child: Text('$title' , style: Theme.of(context).textTheme.button.copyWith(
            fontSize: 18
        ),),
      ),
    );
  }
}

