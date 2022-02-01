import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key, this.back,
  }) : super(key: key);
  final Function? back ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Container(
      margin: EdgeInsets.only(top: 40 , left: 20 , right:  20 ),
      width: size.width ,
      height: 30,
      child: Row(
        children: [
          BackButton(
            onPressed: (){back!();},
            color: kPrimaryColor,
          ),
          Spacer() ,
          Icon(Icons.settings , color: kPrimaryColor,)
        ],
      ),
    );
  }
}
