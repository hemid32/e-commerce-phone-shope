import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/screen_pay/widgets/shopping.dart';

import 'body.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key key, this.title, this.valure, this.price,
  }) : super(key: key);
  final String title ;
  final BestTutorSite valure ;
  final double price ;




  @override
  Widget build(BuildContext context) {
    BestTutorSite _site = BestTutorSite.javatpoint;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20 ),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: valure== _site ? Colors.black.withOpacity(0.07): Colors.white ,

          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: valure ,
                groupValue: _site,
                onChanged: (BestTutorSite value) {
                  /*
                  setState(() {
                      _site = value;
                    });
                   */

                },
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
