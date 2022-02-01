import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({
    Key? key,required this.back,
    required this.backText,
    required this.textButton,required  this.buttonTap,
  }) : super(key: key);
  final Function back ;
  final String backText  ;
  final String  textButton ;
  final Function buttonTap ;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap:(){buttonTap();},
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.8)
            ),
            child: Text('$textButton' , style: Theme.of(context).textTheme.button?.copyWith(
                color: Colors.white , fontSize: 15
            ),),
          ),
        ),
        GestureDetector(
          onTap: (){back();},
          child: Container(

            child: Text('$backText' , style:  Theme.of(context).textTheme.button?.copyWith(
                decoration: TextDecoration.underline, color: Colors.black.withOpacity(0.4)
            ),),
          ),
        )
      ],
    );
  }
}


