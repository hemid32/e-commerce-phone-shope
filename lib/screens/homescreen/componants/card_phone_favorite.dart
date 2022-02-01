import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/produit/produit.dart';
//import 'package:phoneshop/screens/detailProduit/detail_produit.dart';

class CardPhoneChopeFavorite extends StatelessWidget {
  const CardPhoneChopeFavorite({
    Key? key, required this.produit, required this.deletCard, this.onTap,
  }) : super(key: key);
  final Function deletCard ;
  final Function? onTap  ;
  final Produit produit ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap!();},
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
                          produit.image!
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
                      Text( (produit.nomPhone!).length > 23 ? '${(produit.nomPhone!).substring(0,20)}...' : (produit.nomPhone!) , style: Theme.of(context).textTheme.button?.copyWith( fontSize: 14 ),),

                      Spacer()  ,
                      GestureDetector(
                          onTap: (){deletCard();},
                          child: Icon(Icons.close , color: Theme.of(context).iconTheme.color, size: 20,))


                    ],
                  ),
                  SizedBox(height: 5,) ,
                  RichText(
                      maxLines: 3,
                      text: TextSpan(
                          text: produit.detail ,
                          style: Theme.of(context).textTheme.button?.copyWith( fontSize:  12 )
                      )) ,
                  SizedBox(height: 5,) ,

                  Row(
                    children: [
                      Text('RAM :' , style:  Theme.of(context).textTheme.button?.copyWith( fontSize:  12 ),) ,
                      SizedBox(width: 5,) ,
                      Text('${produit.ram} GB' ,style:  Theme.of(context).textTheme.button?.copyWith( fontSize:  12 ),),
                      SizedBox(width: 15,) ,
                      Text('Storage :' , style:  Theme.of(context).textTheme.button?.copyWith(fontSize:  12 ),) ,
                      SizedBox(width: 5,) ,
                      Text('${produit.storage} GB' ,style:  Theme.of(context).textTheme.button?.copyWith( fontSize:  12 ),) ,
                    ],
                  ),
                  SizedBox(height: 5,) ,

                  Row(
                    children: [
                      Text('${produit.price} DZ',style:  Theme.of(context).textTheme.button?.copyWith(color:kPrimaryColor.withOpacity(0.6) , fontSize:  15 )),
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
