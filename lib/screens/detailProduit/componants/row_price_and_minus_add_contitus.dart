import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class RowPriceANDContitus extends StatelessWidget {
  const RowPriceANDContitus({
    Key key,
    @required this.price,
    @required this.priceOld,
  }) : super(key: key);

  final double price;
  final double priceOld;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$price DZ  ' , style:  Theme.of(context).textTheme.button.copyWith(fontSize: 20 , color:  kPrimaryColor )) ,
        priceOld != null ? Text('$priceOld DZ ' , style:  Theme.of(context).textTheme.button.copyWith(fontSize: 15 , decoration:  TextDecoration.lineThrough ,

          color:  Colors.black.withOpacity(0.23) ,

        )) : SizedBox() ,

        Spacer() ,
        Container(
          height: 25 ,
          width:  25 ,
          alignment:Alignment.center,
          decoration: BoxDecoration(
            //color: kBackgroundColor ,
            border: Border.all(color: Colors.black.withOpacity(0.23)) ,
          ),
          child: Container(
            height: 2.5,
            width: 7,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5)
            ),
          ),

        ),
        SizedBox(width:  15,) ,
        Text('1' , style:  Theme.of(context).textTheme.button.copyWith(fontSize: 20),),
        SizedBox(width:  15,) ,
        Container(
          height: 25 ,
          width:  25 ,
          alignment:Alignment.center,
          decoration: BoxDecoration(
            //color: kBackgroundColor ,
            border: Border.all(color: Colors.black.withOpacity(0.23)) ,
          ),
          child: Icon(Icons.add , size: 15,),

        ),

      ],
    );
  }
}

