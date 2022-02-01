import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class logoRdesign extends StatelessWidget {
  const logoRdesign({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      padding: EdgeInsets.all(5),
      width: size.width *0.35,
      height:size.width *0.35 ,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5) ,
        shape: BoxShape.circle ,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration:BoxDecoration(
          color: kPrimaryColor ,
          shape: BoxShape.circle ,

        ),
        child: Text('R' , style: Theme.of(context).textTheme.button?.copyWith(

          color: Colors.white.withOpacity(0.23),
          fontSize:  size.width *0.30 ,
        ),),
      ),
    );
  }
}

