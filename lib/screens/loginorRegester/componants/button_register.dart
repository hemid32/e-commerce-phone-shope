import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ButtonRegister extends StatelessWidget {
  const ButtonRegister({
    Key? key, required this.onTap,
  }) : super(key: key);
  final Function onTap ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return GestureDetector(
      onTap: (){onTap();},
      child: Container(
        alignment: Alignment.center,
        width: size.width *0.3 ,
        height: 40 ,
        decoration: BoxDecoration(
          color: kPrimaryColor ,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4) ,
              blurRadius: 5 ,



            )
          ] ,
          borderRadius:  BorderRadius.circular(20) ,

        ),
        child: Text('Register'
          , style:
          Theme.of(context).textTheme.button?.copyWith(
              color: Colors.white ,
              fontSize: 20
          )
          ,
        ),
      ),
    );
  }
}


