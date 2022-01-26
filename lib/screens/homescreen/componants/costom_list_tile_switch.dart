import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
class CostomListTimeSwitch extends StatelessWidget {
  const CostomListTimeSwitch({
    Key key, this.valur, this.icon,this.title, this.onChanged
  }) : super(key: key);
  final bool valur ;
  final IconData  icon ;
  final String title ;
  final Function onChanged ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:  20),
      height:  65,
      width:  double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor
      ),
      child: Row(
        children: [
          Icon( icon, color: Theme.of(context).iconTheme.color, ) ,
          SizedBox(width: 30,) ,
          Text('$title ' , style: Theme.of(context).textTheme.button) ,
          Spacer() ,
          //Icon(Icons.arrow_forward_ios , color: Colors.black.withOpacity(0.5),)
          Switch(value: valur, onChanged: onChanged , activeTrackColor: kPrimaryColor,)

        ],
      ),
    );
  }
}

