import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class Header extends StatelessWidget {
  const Header({
    Key key, this.title, this.description,
  }) : super(key: key);

  final String title ;
  final String description ;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      padding: EdgeInsets.only(top: 40 , left: 20),
      alignment: Alignment.centerLeft,
      width: size.width,
      height: 160,
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title',style  :  Theme.of(context).textTheme.headline2.copyWith(
              fontSize: 25 ,
            color: Colors.white
          )),
          SizedBox(height: 15,) ,
          Text('$description ', style: Theme.of(context).textTheme.button.copyWith(
            color: Colors.white.withOpacity(0.6)
          ),)
        ],
      ),
    );
  }
}

