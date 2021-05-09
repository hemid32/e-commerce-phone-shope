import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class ProgressShopping extends StatelessWidget {
  const ProgressShopping({
    Key key, this.stat,
  }) : super(key: key);

  final int stat ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:  10),
      width: double.infinity ,
      height: 100,
      //height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircelerChekedIconIsTrue( confermed: stat >= 1  ?  true : false  , icon: Icons.check, title: 'Sand Domand',) ,
          CircelerChekedIconIsTrue( confermed: stat >= 2  ?  true : false, icon: Icons.shopping_bag_outlined, title: 'Accept and SHoping',) ,
          CircelerChekedIconIsTrue( icon:  Icons.check, deletLine: true, title:  'Shoping ', confermed:  stat >= 3  ?  true : false,) ,
          //CircelerChekedIconIsTrue(icon: Icons.account_box,) ,
        ],
      ),
    );
  }
}

class CircelerChekedIconIsTrue extends StatelessWidget {
  const CircelerChekedIconIsTrue({
    Key key, this.confermed = false, this.icon, this.deletLine = false, this.title ,
  }) : super(key: key);
  final bool confermed  ;
  final IconData icon ;
  final String title ;
  final deletLine ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 45,
              width:  45,
              decoration: BoxDecoration(
                  color: confermed ? kPrimaryColor.withOpacity(0.7) : Colors.black.withOpacity(0.1),
                  shape: BoxShape.circle ,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.07) ,
                        blurRadius: 10 ,
                        offset: Offset(0,10)
                    )
                  ]
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: confermed ?  Colors.white : Colors.transparent,
                  shape: BoxShape.circle ,

                ),
                child: Icon( confermed ? Icons.check : icon , color: Colors.black.withOpacity(0.4),),
              ),
            ),

            deletLine ? SizedBox(): Container(
              width: (size.width -(45 *3 + 40 ))/2  ,
              height: 5,
              decoration: BoxDecoration(
                color: confermed ? kPrimaryColor.withOpacity(0.7) : Colors.black.withOpacity(0.07) ,
                gradient: LinearGradient(
                  colors: [
                  kPrimaryColor ,
                  kPrimaryColor.withOpacity(0.15) ,
                ] ,
                )

              ),
            )

          ],
        ),

        Expanded(
          child: Container(
            //margin: EdgeInsets.only(top: 10),
            width:45 ,
            child: Text('$title ' , style: Theme.of(context).textTheme.button.copyWith(fontSize: 12, color: Colors.black.withOpacity(0.5)),),
          ),
        )

      ],
    );
  }
}

