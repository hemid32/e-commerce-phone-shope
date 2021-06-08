
import 'package:flutter/material.dart';

class ButtonCotomLogIn extends StatelessWidget {
  const ButtonCotomLogIn({
    Key key, this.onTap, this.title, this.color,
  }) : super(key: key);
  final Function onTap ;
  final String title  ;
  final Color color ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size.width *0.7,
        height: 50,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Text('$title' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize: 20),),

      ),
    );
  }
}

