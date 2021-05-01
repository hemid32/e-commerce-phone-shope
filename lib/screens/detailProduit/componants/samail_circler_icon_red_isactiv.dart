import 'package:flutter/material.dart';

class SmailCardCircleIconRed extends StatelessWidget {
  const SmailCardCircleIconRed({
    Key key, this.activeRed = true, this.icon,
  }) : super(key: key);
  final bool activeRed ;
  final Widget icon ;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height:  40,
      width:  40 ,
      decoration: BoxDecoration(
        color: Colors.white ,
        shape: BoxShape.circle ,
        border: Border.all(color: Colors.black.withOpacity(0.12)) ,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10 ,
            offset: Offset(0,10)
          )
        ]

      ),
      child: Stack(
        children: [
          icon ,
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              height: 10,
              width:  10 ,
              decoration: BoxDecoration(
                shape: BoxShape.circle ,
                color: activeRed ? Colors.red  : Colors.transparent,

              ),
            ),
          )
        ],
      ),
    );
  }
}

