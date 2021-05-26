import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/widgets/shopping.dart';

import 'body.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key key, this.title, this.valure, this.price, this.groub, this.onChanged,
  }) : super(key: key);
  final String title ;
  final String  valure ;
  final double price ;
  final String   groub  ;
  final Function onChanged ;




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20 ),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color:  Colors.black.withOpacity(0.07) ,

          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: valure ,
                groupValue: groub,
                onChanged: onChanged,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$title ' ,style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.5) , fontSize: 15),),
                  Text('$price DZ ' ,style: Theme.of(context).textTheme.button.copyWith(color: kPrimaryColor.withOpacity(0.5) , fontSize: 15),),
                ],
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider())
      ],
    );
  }
}
