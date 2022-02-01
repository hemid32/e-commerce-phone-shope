import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phoneshop/bloc/languge/bloc.dart';
import 'package:phoneshop/constant.dart';

class ItemListMenu extends StatelessWidget {
  const ItemListMenu({
    Key? key, required this.title, required this.icon, required this.valueLang ,
  }) : super(key: key);
  final String title ;
  final String icon ;
  final String valueLang ;
  

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(icon , width: 30, height: 30,) ,
          SizedBox(width: 10,) ,
          SizedBox(
            width: 150,
            child: Text(title ,style: Theme.of(context).textTheme.button?.copyWith(
                fontSize: 12
            ),),
          ) ,
          Spacer() ,
          Icon(Icons.circle, size: 20, color: valueLang == BlocLanguage.get(context).locale.toString() ? kPrimaryColor : Colors.grey.withOpacity(0.4), )
        ],
      ),);
  }
}
