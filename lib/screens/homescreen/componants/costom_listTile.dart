import 'package:flutter/material.dart';

class CostomListTile extends StatelessWidget {
  const CostomListTile({
    Key key, this.title, this.icon, this.onTap,
  }) : super(key: key);
  final String title ;
  final IconData icon ;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:  20),
        height:  65,
        width:  double.infinity,
        child: Row(
          children: [
            Icon(icon , color: Colors.black.withOpacity(0.5), ) ,
            SizedBox(width: 30,) ,
            Text('$title ' , style: Theme.of(context).textTheme.button.copyWith(
                color: Colors.black.withOpacity(0.5)
            ),) ,
            Spacer() ,
            Icon(Icons.arrow_forward_ios , color: Colors.black.withOpacity(0.5),)

          ],
        ),
      ),
    );
  }
}

