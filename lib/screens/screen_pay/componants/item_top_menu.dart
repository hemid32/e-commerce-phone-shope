import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
class Items_Menuu extends StatelessWidget {
  const Items_Menuu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20 , left:  20 , right:  20),
      child: Row(
        children: [
          ItemTopMenu(title:  'Adress ', active:  true,) ,
          ItemTopMenu(title:  'Shopping', active:  false , fin:  true ,) ,
          ItemTopMenu(title: 'Verefaid', active:  false ,) ,
          ItemTopMenu(title: 'Buy', active: false,) ,

        ],
      ),
    );
  }
}



class ItemTopMenu extends StatelessWidget {

  const ItemTopMenu({
    Key key, this.title ,this.active = false, this.fin = false
  }) : super(key: key);
  final bool active ;
  final bool fin  ;
  final String title ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      width:  size.width / 4  - kDefaultPadding/2,
      child: Column(
        children: [
          Text('$title' , style: Theme.of(context).textTheme.button.copyWith(
            color: active ? kPrimaryColor.withOpacity(0.6) : Colors.black.withOpacity(0.4) ,
          ),) ,
          Divider( color: active || fin  ? kPrimaryColor.withOpacity(0.6) :  Colors.black.withOpacity(0.23) ),

        ],
      ),

    );
  }
}

