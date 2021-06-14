

import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class CardPhoneSearsh extends StatelessWidget {
  const CardPhoneSearsh({
    Key key, this.title, this.price, this.image, this.onTap,
  }) : super(key: key);

  final String title ;
  final String price ;
  final String image ;
  final Function onTap ;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.circular(15) ,
        boxShadow: [
          BoxShadow(
              color:Colors.black.withOpacity(0.15) ,
              blurRadius: 8 ,
              offset: Offset(0, 10)
          )
        ] ,

      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5) ,
              image: DecorationImage(
                  image: AssetImage(image) ,
                  fit: BoxFit.cover
              ) ,

            ),
          ) ,
          SizedBox(width: 10,) ,
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Text(title ,
                  style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.black.withOpacity(0.4) ,
                      fontSize: 18 ,
                      fontWeight: FontWeight.bold

                  ),
                )   ,
                Spacer() ,
                Text('$price DZ' ,

                  style: Theme.of(context).textTheme.button.copyWith(
                      color: kPrimaryColor ,
                      fontSize: 16 ,
                      fontWeight: FontWeight.bold

                  ),
                )   ,

              ],
            ),
          ),
          Spacer() ,
          Container(
            //margin: EdgeInsets.symmetric(vertical: 15),
            child: Icon(Icons.arrow_forward_ios , size: 30, color: kPrimaryColor.withOpacity(0.4),),
          ),
        ],
      ),
    );
  }
}

