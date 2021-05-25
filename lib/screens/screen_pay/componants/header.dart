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
          GestureDetector(
              onTap: ()=>  Navigator.pop(context),
              child: Icon(Icons.close , color: Colors.black.withOpacity(0.4),size: 30,)) ,
          Spacer() ,
          Text('Buy' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) ,fontSize: 20),) ,
          SizedBox(width: 20,) ,
          Icon(Icons.chevron_right ,color: Colors.black.withOpacity(0.4),size: 30,) ,
        ],
      ),
    );
  }
}
