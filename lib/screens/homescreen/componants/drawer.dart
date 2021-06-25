import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phoneshop/screens/homescreen/componants/costom_listTile.dart';

class DrawerApps extends StatelessWidget {
  const DrawerApps({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40 , bottom: 10),
            child: SvgPicture.asset('assets/icons/icons8-apple-logo.svg'),
          ),
          CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
          CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
          CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
          CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
          CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,
          CostomListTile(title: 'Messages' , icon: Icons.message,onTap: (){},) ,

        ],
      ),
    ),
    );
  }
}
