import 'package:flutter/material.dart';

class ContainerAndIconAndText_Seach extends StatelessWidget {
  const ContainerAndIconAndText_Seach({
    Key key, this.title, this.icon, this.onTap,
  }) : super(key: key);
  final String title ;
  final Widget icon ;
  final Function onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20 , right:  20 , top: 10),
        height: 50,
        width:  double.infinity ,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.06)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ,
            SizedBox(width: 10,),
            Text('$title') ,

          ],
        ) ,
      ),
    );
  }
}

