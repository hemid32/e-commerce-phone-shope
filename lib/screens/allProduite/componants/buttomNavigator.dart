import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ButtomNavigatorBars extends StatelessWidget {
  const ButtomNavigatorBars({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2 ,
            decoration: BoxDecoration(
                color: kPrimaryColor ,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20)
                )
            ),
            child: Text('FILTER' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize:  20),),
          )
        ],
      ),
    );
  }
}
