import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/bloc/userManagze/userVirifaid/bloc.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/search/search_screen.dart';

class SearchAndIconMenu extends StatelessWidget {
  const SearchAndIconMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        GestureDetector(
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
              value: BlocProvider.of<BlocUserVerifaid>(context),
              child: Search()))),
          child: Container(
            margin: EdgeInsets.only(top: 50, left: kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.centerLeft,
            height: 40,
            width: size.width * 0.75,
            decoration: BoxDecoration(
                color:  Theme.of(context).buttonColor,// Colors.black.withOpacity(0.090),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Hero(
                  tag: 'search',
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',width: 40,color: Theme.of(context).canvasColor,
                  ),
                ),
                SizedBox(width: 5,) ,
                Text('Search' , style: Theme.of(context).textTheme.bodyText2,) ,
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 50, ),

              height: 40,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: ()=> Scaffold.of(context).openDrawer(),
                child: Icon(
                  Icons.menu,
                  color:  Theme.of(context).canvasColor,
                ),
              ),
            )),
      ],
    );
  }
}
