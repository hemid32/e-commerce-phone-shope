

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phoneshop/constant.dart';

class CardPhoneSearsh extends StatelessWidget {
  const CardPhoneSearsh({
    Key? key,required  this.title,required this.price,required this.image,required this.onTap,required this.ram,required this.storage,
  }) : super(key: key);

  final String title ;
  final String price ;
  final String image ;
  final Function onTap ;
  final String ram ;
  final String storage ;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap();},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5 , vertical: 5),
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
                    image: NetworkImage(image) ,
                    fit: BoxFit.cover
                ) ,

              ),
            ) ,
            SizedBox(width: 10,) ,
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ,
                    style: Theme.of(context).textTheme.button?.copyWith(
                        fontSize: 18 ,
                        fontWeight: FontWeight.bold

                    ),
                  )   ,
                  Spacer() ,
                  Row(
                    children: [
                      Text('$price DZ' ,

                        style: Theme.of(context).textTheme.button?.copyWith(
                            color: kPrimaryColor ,
                            fontSize: 16 ,
                            fontWeight: FontWeight.bold

                        ),
                      ),

                      SizedBox(width: 10,) ,

                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/ram.svg' , width: 20, height: 20,) ,
                          SizedBox(width: 5,) ,
                          Text('$ram GB' , style: Theme.of(context).textTheme.button?.copyWith(
                            fontSize: 12
                          ),)
                        ],
                      ),
                      SizedBox(width: 10,) ,

                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/storage.svg' , width: 15, height: 15,) ,
                          SizedBox(width: 5,) ,
                          Text('$storage GB',style: Theme.of(context).textTheme.button?.copyWith(
                              fontSize: 12
                          ),)
                        ],
                      )

                    ],
                  )   ,

                ],
              ),
            ),
            //Spacer() ,
            /*
            Container(
              //margin: EdgeInsets.symmetric(vertical: 15),
              child: Icon(Icons.arrow_forward_ios , size: 30, color: kPrimaryColor.withOpacity(0.4),),
            ),

             */
          ],
        ),
      ),
    );
  }
}

