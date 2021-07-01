import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ContainerMayOrder extends StatelessWidget {

  const ContainerMayOrder({
    Key key, this.icon, this.date, this.pay, this.state, this.onTap, this.smilIcon,
  }) : super(key: key);
  final IconData icon ;
  final String  date ;
  final String pay ;
  final String state ;
  final Function onTap ;
  final IconData smilIcon ;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Container(
      width: size.width *0.9,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: size.width*0.3,
            height: 140 ,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1)
            ),
            child: Icon(icon , color: Colors.black.withOpacity(0.4),size: 110,),
          ) ,
          SizedBox(width: 10,) ,
          Expanded(child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date : $date', style: Theme.of(context).textTheme.button.copyWith(
                    color: kPrimaryColor ,
                    fontSize: 14
                ),) ,
                //SizedBox(height: 20,) ,
                Spacer() ,
                Text('Pay : $pay DZ', style: Theme.of(context).textTheme.button.copyWith(
                    color: Colors.black.withOpacity(0.4) ,
                    fontSize: 14
                ),) ,
                SizedBox(height: 10,) ,
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor
                      ),

                      child: Icon(Icons.email, size: 10, color: Colors.white,),
                    ) ,

                    Spacer() ,

                    Text('$state', style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.black.withOpacity(0.4) ,
                        fontSize: 14
                    ),),
                  ],
                ) ,
              ],
            ),
          ))

        ],
      ),
    );
  }
}

