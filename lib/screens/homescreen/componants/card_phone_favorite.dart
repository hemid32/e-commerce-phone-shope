import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';

class CardPhoneChopeFavorite extends StatelessWidget {
  const CardPhoneChopeFavorite({
    Key key, this.image, @required this.title, @required  this.detail, @required this.ram, @required this.storage, @required this.price, @required this.contitu, @required this.deletCard,
  }) : super(key: key);

  final String image ;
  final String title ;
  final String detail ;
  final int ram ;
  final int storage ;
  final double price  ;
  final int contitu  ;
  final Function deletCard ;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140 ,
      decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.circular(0) ,

      ),

      margin: EdgeInsets.symmetric(vertical: 10 , horizontal:  20),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07) ,
                image:  DecorationImage(
                    image: AssetImage(
                        image
                    ) ,
                    fit: BoxFit.cover
                )
            ),
          ) ,
          Expanded(child: Container(

            height: 140,


            padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text( title , style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.6) , fontSize: 15 ),),

                    Spacer()  ,
                    GestureDetector(
                        onTap: deletCard,
                        child: Icon(Icons.close , color: Colors.black.withOpacity(0.6), size: 20,))


                  ],
                ),
                SizedBox(height: 5,) ,
                RichText(
                    maxLines: 3,
                    text: TextSpan(
                        text: detail ,
                        style: Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) , fontSize:  12 )
                    )) ,
                SizedBox(height: 5,) ,

                Row(
                  children: [
                    Text('RAM :' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) , fontSize:  12 ),) ,
                    SizedBox(width: 5,) ,
                    Text('$ram GB' ,style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) , fontSize:  12 ),),
                    SizedBox(width: 15,) ,
                    Text('Storage :' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) , fontSize:  12 ),) ,
                    SizedBox(width: 5,) ,
                    Text('$storage GB' ,style:  Theme.of(context).textTheme.button.copyWith(color: Colors.black.withOpacity(0.4) , fontSize:  12 ),) ,
                  ],
                ),
                SizedBox(height: 5,) ,

                Row(
                  children: [
                    Text('$price DZ',style:  Theme.of(context).textTheme.button.copyWith(color:kPrimaryColor.withOpacity(0.6) , fontSize:  15 )),
                  ],
                )

              ],
            ),
          ))
        ],
      ),
    );
  }
}
