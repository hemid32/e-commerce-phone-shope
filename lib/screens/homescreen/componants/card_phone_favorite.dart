import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';

class CardPhoneChopeFavorite extends StatelessWidget {
  const CardPhoneChopeFavorite({
    Key key, this.image, @required this.title, @required  this.detail, @required this.ram, @required this.storage, @required this.price, @required this.contitu, @required this.deletCard, this.onTap,
  }) : super(key: key);

  final String image ;
  final String title ;
  final String detail ;
  final int ram ;
  final int storage ;
  final double price  ;
  final int contitu  ;
  final Function deletCard ;
  final Function onTap  ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140 ,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor ,
          borderRadius: BorderRadius.circular(0) ,

        ),

        margin: EdgeInsets.symmetric(vertical: 10 , horizontal:  20),
        child: Row(
          children: [
            Container(
              height: 140,
              width: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor ,
                  image:  DecorationImage(
                      image: NetworkImage(
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
                      Text( title.length > 23 ? '${title.substring(0,20)}...' : title , style: Theme.of(context).textTheme.button.copyWith( fontSize: 14 ),),

                      Spacer()  ,
                      GestureDetector(
                          onTap: deletCard,
                          child: Icon(Icons.close , color: Theme.of(context).iconTheme.color, size: 20,))


                    ],
                  ),
                  SizedBox(height: 5,) ,
                  RichText(
                      maxLines: 3,
                      text: TextSpan(
                          text: detail ,
                          style: Theme.of(context).textTheme.button.copyWith( fontSize:  12 )
                      )) ,
                  SizedBox(height: 5,) ,

                  Row(
                    children: [
                      Text('RAM :' , style:  Theme.of(context).textTheme.button.copyWith( fontSize:  12 ),) ,
                      SizedBox(width: 5,) ,
                      Text('$ram GB' ,style:  Theme.of(context).textTheme.button.copyWith( fontSize:  12 ),),
                      SizedBox(width: 15,) ,
                      Text('Storage :' , style:  Theme.of(context).textTheme.button.copyWith(fontSize:  12 ),) ,
                      SizedBox(width: 5,) ,
                      Text('$storage GB' ,style:  Theme.of(context).textTheme.button.copyWith( fontSize:  12 ),) ,
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
      ),
    );
  }
}
