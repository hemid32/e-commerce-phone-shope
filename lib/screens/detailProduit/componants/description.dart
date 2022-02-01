import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class DescriptionProduit extends StatelessWidget {
  const DescriptionProduit({
    Key? key, this.description,
  }) : super(key: key);

  final description ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( 'Description' , style: Theme.of(context).textTheme.button?.copyWith(fontSize: 20  ) ),
        Divider() ,

        SizedBox(height: 10,) ,

        RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                text: description ,
                style:  Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor.withOpacity(0.8) , fontSize: 15)
            )) ,

      ],
    );
  }
}

