import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class SmallCardCod extends StatelessWidget {
  const SmallCardCod({
    Key key, this.codControl, this.autoFecos = false, this.onChnaged, this.focusNode,
  }) : super(key: key);

  final TextEditingController codControl  ;

  final bool  autoFecos ;
  final Function onChnaged ;
  final FocusNode focusNode ;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor ,
          border: Border.all(color: kPrimaryColor)
      ),
      child: TextFormField(
        focusNode: focusNode ,
        onChanged: onChnaged,
        autofocus: autoFecos,
        textAlign: TextAlign.center,
        controller: codControl,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: Theme.of(context).textTheme.button.copyWith(
            fontSize: 20 ,
            fontWeight: FontWeight.bold
        ),

        decoration: InputDecoration(
          border: InputBorder.none ,
          counterText: "" ,

        ),
      ),
    );
  }
}


