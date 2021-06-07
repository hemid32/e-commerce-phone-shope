import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/bloc.dart';
import 'package:phoneshop/bloc/favorite/event.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/bloc.dart';
import 'package:phoneshop/bloc/manageScreen/detailProduit/event.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/model/favorite/model.dart';
import 'package:phoneshop/model/produit/servises.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';





class ItemsCardBestSellingPHone extends StatelessWidget {
  const ItemsCardBestSellingPHone({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<BlocFavoriteManage>(context).add(EventFav(idItem: null)) ;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<BlocFavoriteIs ,  int >(
        builder: (context, snapshot) {
          return Row(
            children: [
              for(var i  = 0 ; i< getProduitColors().produits.length ; i++  )
                FutureBuilder(
                  future:  FavoriteModelItem(produit: getProduitColors().produits[i]).ifFavorite(),
                  builder: (_ , data){
                  return  data.hasData ?  CardPhoneItems(
                    title: getProduitColors().produits[i].listProduits[i].nomPhone , // i deleted
                    price:  getProduitColors().produits[i].listProduits[i].price,
                    descreption: getProduitColors().produits[i].listProduits[i].detail ,
                    image: getProduitColors().produits[i].listProduits[i].image ,
                    onTap: (){
                      BlocProvider.of<BlocScreenDetailProduit>(context).add(EvensGoToProduit(indexProduit: 0 , produisColors: getProduitColors().produits[i] )) ;
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider.value(
                        value: BlocProvider.of<BlocScreenDetailProduit>(context),
                        child:  DetailProduit() ,
                      )));},
                    id: getProduitColors().produits[i].id ,
                    fav:  data.data,
                    onTapFav: ()=> BlocProvider.of<BlocFavoriteIs>(context).add(IsTapOnFavEvent(getProduitColors().produits[i])),
                  ) : Container(); },
                ),
            ],
          );
        }
      ),
    );
  }
}




class CardPhoneItems extends StatelessWidget {
  const CardPhoneItems({
    Key key, this.image, this.title, this.descreption, this.price, this.pricintage, this.onTap, this.id, this.fav, this.onTapFav,
  }) : super(key: key);
  final String image ;
  final String title ;
  final String descreption ;
  final double price ;
  final int pricintage ;
  final Function onTap ;
  final int id  ;
  final bool fav  ;
  final Function onTapFav ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return GestureDetector(
      onTap: onTap,
           child: Container(
            margin:  EdgeInsets.symmetric(horizontal: 10 , vertical:  20),
            width:  size.width /  2 -10 ,
            height:  310 ,
            decoration:  BoxDecoration(
              color:  Colors.white ,
              borderRadius: BorderRadius.circular(20) ,

            ),

            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10 , vertical:  10),
                  child: Row(
                    children: [
                      pricintage != null ? Container(
                        alignment: Alignment.center ,
                        height:  35,
                        width:  35,
                        decoration: BoxDecoration(
                          color:  Colors.red.withOpacity(0.5) ,
                          shape: BoxShape.circle ,
                        ),
                        child: Text('$pricintage%' , style:  Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize: 12),),
                      ): SizedBox(),
                      Spacer() ,

                      GestureDetector(
                        onTap: onTapFav,
                        child: Container(
                          alignment: Alignment.center,
                          height:  35,
                          width:  35,
                          decoration:  BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.1)),
                              shape: BoxShape.circle ,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0 , 8) ,
                                  color: Colors.black.withOpacity(0.23) ,
                                  blurRadius: 40 ,
                                )
                              ]
                          ),
                          child:  Icon(Icons.favorite , color : fav ? Colors.red :    Colors.grey,)
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15,) ,
                Container(
                  width: size.width / 2 - 40 ,
                  height:  150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            image ,

                          ) ,
                          fit: BoxFit.cover


                      ) ,
                      borderRadius:  BorderRadius.circular(20)
                  ),
                ) ,

                RichText(

                    textAlign: TextAlign.center,
                    maxLines: 3,
                    text: TextSpan(

                        children: [
                          TextSpan(
                              text:  '$title\n ' , style:  Theme.of(context).textTheme.button
                          ) ,
                          TextSpan(
                              text: '$descreption ' , style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.black.withOpacity(0.23) ,

                          )
                          ) ,
                        ]
                    )) ,
                SizedBox(height: 10,) ,

                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 5 , right: 5 , left:  5),
                    width: double.infinity  ,
                    //height:  40 ,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20) ,

                    ),
                    child: Text('$price DZ' , style : Theme.of(context).textTheme.button.copyWith(color: Colors.white , fontSize: 20)),
                  ),
                )
              ],
            ),

          )

    );
  }
}




