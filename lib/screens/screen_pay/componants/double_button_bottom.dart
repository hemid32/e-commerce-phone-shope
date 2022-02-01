import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class DoubleButtonButtom extends StatelessWidget {
  const DoubleButtonButtom({
    Key? key, this.iconBunnGreen, this.iconBunnWaith, this.titleBunnGreen,
     this.titleBunnWaith, this.onTapWath, this.onTapGreen,
  }) : super(key: key);
  final IconData? iconBunnGreen  ;
  final IconData? iconBunnWaith  ;
  final String? titleBunnGreen ;
  final String? titleBunnWaith ;
  final Function? onTapWath ;
  final Function? onTapGreen ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  20),
      width: size.width - 40,
      height: 40 ,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){onTapGreen!();},
            child: Container(
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
                    Text('$titleBunnGreen',style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white) ) ,
                    SizedBox(width: 10,) ,
                    Icon(iconBunnGreen, color: Colors.white,)
                  ],
                ),
              ),
            ),
          ) ,
          Expanded(
            child: GestureDetector(
              onTap: (){onTapWath!();},
              child: Container(
                //width: (size.width / 2 ) -20,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor ,
                ),

                child: Container(
                  margin:EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$titleBunnWaith' ,style: Theme.of(context).textTheme.button,) ,
                      SizedBox(width: 10,) ,
                      Expanded(child: Icon(iconBunnWaith))
                    ],
                  ),
                ),


              ),
            ) ,

          )
        ],
      ),
    );
  }
}

