import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30 , left: 20 , right: 20),
      child: Row(
        children: [
          Icon(Icons.arrow_back, color: Colors.black,size: 30, ) ,

          Expanded(
            child: Center(
              child: Text('Messages with story' ,  style:
              Theme.of(context).textTheme.button.copyWith(
                color: Colors.black.withOpacity(0.5)  ,
                fontSize: 17 ,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
