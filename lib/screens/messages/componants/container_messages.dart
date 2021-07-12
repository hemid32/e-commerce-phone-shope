import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class MessageUser extends StatelessWidget {
  const MessageUser({
    Key key, this.text,
  }) : super(key: key);
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.23) ,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8) ,
                topRight: Radius.circular(8) ,
                bottomLeft: Radius.circular(8) ,
              )

          ),
          child: Text('$text' , style: Theme.of(context).textTheme.button.copyWith(
              fontSize: 18
          ),),
        ),

    );
  }
}

class MessageAdmin extends StatelessWidget {
  const MessageAdmin({
    Key key, this.text,
  }) : super(key: key);
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white ,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8) ,
              topRight: Radius.circular(8) ,
              bottomRight: Radius.circular(8) ,
            )

        ),
        child: Text('$text' , style: Theme.of(context).textTheme.button.copyWith(
            fontSize: 18
        ),),
      ),
    );
  }
}

