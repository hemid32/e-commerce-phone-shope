import 'package:flutter/material.dart';

class ButtonSandSms extends StatelessWidget {
  const ButtonSandSms({
    Key key, this.onTap, this.isSand = false ,
  }) : super(key: key);
  final Function onTap ;
  final bool isSand ; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSand ? (){} :  onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor ,
            border: Border.all(color: Theme.of(context).iconTheme.color)
        ),
        child: Text('Sand sms' , style: Theme.of(context).textTheme.headline1.copyWith(
          color: isSand ? Theme.of(context).textTheme.headline1.color.withOpacity(0.3) :Theme.of(context).textTheme.headline1.color
        ),),
      ),
    );
  }
}
