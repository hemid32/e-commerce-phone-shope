import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ButtonBottom extends StatelessWidget {
  const ButtonBottom({
    Key? key,required this.onTap,required this.widget,
  }) : super(key: key);
  final Function onTap;
  final Widget widget ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return GestureDetector(
      onTap: (){onTap();},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: size.width,
        height: 40,
        decoration: BoxDecoration(
            color: kPrimaryColor ,
            borderRadius: BorderRadius.circular(20)
        ),
        child: widget,
      ),
    );
  }
}
