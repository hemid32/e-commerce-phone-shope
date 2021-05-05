import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
class FooterButtons extends StatelessWidget {
  const FooterButtons({
    Key key, this.titleButton1, this.titleButton2, this.onTapButton1, this.onTapButton2,
  }) : super(key: key);
  final String titleButton1 ;
  final String titleButton2 ;
  final Function onTapButton1 ;
  final Function onTapButton2 ;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;


    return Container(
      height:  50 ,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTapButton1,
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: size.width * 0.55,
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.8)
              ),

              child: Text('$titleButton1' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize: 15),),

            ),
          ),
          SizedBox(width: 10,) ,
          Expanded(child: GestureDetector(
            onTap: onTapButton2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07) ,

              ),
              child: Text('$titleButton2' , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black , fontSize: 15)),
            ),
          ))
        ],
      ),
    );
  }
}

