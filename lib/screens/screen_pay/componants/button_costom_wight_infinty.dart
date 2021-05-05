import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ButtonCostomWithInfiniti extends StatelessWidget {
  const ButtonCostomWithInfiniti({
    Key key, this.title, this.onTap,
  }) : super(key: key);
  final String title ;
  final Function onTap  ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.7)
        ),
        child: Text('$title ' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.white, fontSize: 15), ),
      ),
    );
  }
}

