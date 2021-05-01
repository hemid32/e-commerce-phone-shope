import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/detailProduit/detail_produit.dart';

class ItemsCardBestSellingPHone extends StatelessWidget {
  const ItemsCardBestSellingPHone({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardPhoneItems(
            title: 'Sumsung',
            price:  50000,
            descreption:  'hemddv v dvdfv dvdf vdf vdfv ',
            image: 'assets/images/iphone-x-samsung-galaxy-s8-iphone-7-smartphone-png-favpng-7ke4DBbj5kLrbQftMD6XuN56h.jpg' ,
            pricintage: 100,
          ),
          CardPhoneItems(
            title: 'Sumsung',
            price:  50000,
            descreption:  'hemddv v dvdfv dvdf vdf vdfv ',
            image: 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
          ),
          CardPhoneItems(
            title: 'Sumsung',
            price:  50000,
            descreption:  'hemddv v dvdfv dvdf vdf vdfv ',
            image: 'assets/images/poco.png' ,
          ),
          CardPhoneItems(
            title: 'Sumsung',
            price:  50000,
            descreption:  'hemddv v dvdfv dvdf vdf vdfv ',
            image: 'assets/images/497-4975081_samsung-galaxy-a70-2020-hd-png-download.png' ,
            pricintage: 50,
          ),
          CardPhoneItems(
            title: 'Sumsung',
            price:  50000,
            descreption:  'hemddv v dvdfv dvdf vdf vdfv ',
            image: 'assets/images/samsung-galaxy-s8-4g-smartphone-png-favpng-qNm18RuFag7316FekDYk0Pqy4.jpg' ,
            pricintage: 20,
          ),
        ],
      ),
    );
  }
}

class CardPhoneItems extends StatelessWidget {
  const CardPhoneItems({
    Key key, this.image, this.title, this.descreption, this.price, this.pricintage,
  }) : super(key: key);
  final String image ;
  final String title ;
  final String descreption ;
  final double price ;
  final int pricintage ;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailProduit())),
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

                  Container(
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
                    child: Icon(Icons.favorite , color:  Colors.grey,),
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

      ),
    );
  }
}


