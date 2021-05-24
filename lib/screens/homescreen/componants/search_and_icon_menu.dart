import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/constant.dart';

class SearchAndIconMenu extends StatelessWidget {
  const SearchAndIconMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50, left: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.centerLeft,
          height: 40,
          width: size.width * 0.75,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.090),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/search.svg',width: 40,
              ),
              SizedBox(width: 5,) ,
              Text('Search' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.3)),) ,
            ],
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        )),
      ],
    );
  }
}
