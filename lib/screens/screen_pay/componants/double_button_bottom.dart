import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class DoubleButtonButtom extends StatelessWidget {
  const DoubleButtonButtom({
    Key key, this.iconBunnGreen, this.iconBunnWaith, this.titleBunnGreen, this.titleBunnWaith,
  }) : super(key: key);
  final IconData iconBunnGreen  ;
  final IconData iconBunnWaith  ;
  final String titleBunnGreen ;
  final String titleBunnWaith ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
      width: size.width - 40,
      height: 40 ,
      child: Row(
        children: [
          Container(
            width: (size.width / 2 ) -20,
            height: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor ,
            ),
            child: Container(
              margin:EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$titleBunnGreen',style: Theme.of(context).textTheme.button.copyWith(color: Colors.white) ) ,
                  SizedBox(width: 10,) ,
                  Icon(iconBunnGreen, color: Colors.white,)
                ],
              ),
            ),
          ) ,
          Expanded(
            child: Container(
              //width: (size.width / 2 ) -20,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white ,
              ),

              child: Container(
                margin:EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$titleBunnWaith' ,style: Theme.of(context).textTheme.button,) ,
                    SizedBox(width: 10,) ,
                    Icon(iconBunnWaith)
                  ],
                ),
              ),


            ) ,

          )
        ],
      ),
    );
  }
}

