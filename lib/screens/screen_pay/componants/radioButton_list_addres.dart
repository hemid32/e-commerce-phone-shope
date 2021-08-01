

import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/widgets/shopping.dart';

import 'body.dart';

class RadioButtonListAddress extends StatelessWidget {
  const RadioButtonListAddress({
    Key key, this.title, this.valure, this.groub, this.onChanged,
  }) : super(key: key);
  final String title ;
  final String  valure ;
  final String   groub  ;
  final Function onChanged ;




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20 ),
          height: 60,
          //width: double.infinity,
          decoration: BoxDecoration(
            //color:  Colors.black.withOpacity(0.07) ,

          ),

          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    activeColor: kPrimaryColor,
                    value: valure ,
                    groupValue: groub,
                    onChanged: onChanged,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( title.length < 15 ? '$title ' : '${title.substring(0,10)} ...' ,style: Theme.of(context).textTheme.button.copyWith( fontSize: 15),),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 20,) ,
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
