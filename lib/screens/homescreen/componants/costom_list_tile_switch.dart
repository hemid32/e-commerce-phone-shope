import 'package:flutter/material.dart';
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
      child: Row(
        children: [
          Icon( icon, color: Colors.black.withOpacity(0.5), ) ,
          SizedBox(width: 30,) ,
          Text('$title ' , style: Theme.of(context).textTheme.button.copyWith(
              color: Colors.black.withOpacity(0.5)
          ),) ,
          Spacer() ,
          //Icon(Icons.arrow_forward_ios , color: Colors.black.withOpacity(0.5),)
          Switch(value: false, onChanged: onChanged)

        ],
      ),
    );
  }
}

