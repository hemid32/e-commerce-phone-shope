import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/widgets/shopping.dart';

import 'body.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,required this.title,required this.valure,required this.price,required this.groub,required this.onChanged,
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
            color:  Theme.of(context).accentColor ,

          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                activeColor: kPrimaryColor,
                value: valure ,
                groupValue: groub,
                onChanged: (v){onChanged(v);},
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$title ' ,style: Theme.of(context).textTheme.button?.copyWith(fontSize: 15),),
                  Text('$price DZ ' ,style: Theme.of(context).textTheme.button?.copyWith( color: kPrimaryColor, fontSize: 15),),
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
