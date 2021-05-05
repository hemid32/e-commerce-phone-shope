import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.close) ,
          Spacer() ,
          Text('Buy' , style: Theme.of(context).textTheme.button,) ,
          SizedBox(width: 20,) ,
          Icon(Icons.chevron_right) ,
        ],
      ),
    );
  }
}
