import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/constant.dart';

class Header extends StatelessWidget {
  const Header({
    Key key, this.title, this.logo,
  }) : super(key: key);
  final String title ;
  final String logo ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 40, left: kDefaultPadding, right: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          SizedBox(width: 30,) ,
          Container(


              alignment: Alignment.centerLeft,
              child: Text('$title ' , style:  Theme.of(context).textTheme.button.copyWith(fontSize: 20),)),
          Spacer() ,

          Container(

            height:  70,
            width:  70,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle ,
            ),

            child: SvgPicture.asset(logo ,),
          ),
          /*
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )

           */

        ],
      ),
    );
  }
}
