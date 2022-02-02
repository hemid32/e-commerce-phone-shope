import 'package:flutter/material.dart';

class CostomListTile extends StatelessWidget {
  const CostomListTile({
    Key? key,required this.title,required this.icon,required this.onTap,
  }) : super(key: key);
  final String title ;
  final IconData icon ;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){onTap();},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:  20 , vertical: 2),
        height: 50,
        width:  double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor
        ),
        child: Row(
          children: [
            Icon(icon ,  color:  Theme.of(context).iconTheme.color, ) ,
            SizedBox(width: 30,) ,
            Text('$title ' , style: Theme.of(context).textTheme.button,) ,
            Spacer() ,
            Icon(Icons.arrow_forward_ios , color:  Theme.of(context).iconTheme.color, size: 25,)

          ],
        ),
      ),
    );
  }
}

