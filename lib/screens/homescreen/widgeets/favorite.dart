import 'package:flutter/material.dart';
import 'package:phoneshop/constant.dart';
import 'package:phoneshop/screens/homescreen/componants/card_phone_favorite.dart';
import 'package:phoneshop/screens/homescreen/componants/favorite_header.dart';
import 'package:phoneshop/screens/homescreen/componants/search_and_icon_menu.dart';

class Favorite extends StatelessWidget {
  const Favorite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.withOpacity(0.23),
      child: Column(
        children: [
          SearchAndIconMenu() ,
          //HeaderFavorite() ,
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Divider()) ,
          for(var i =0 ; i<3 ; i++)  CardPhoneChopeFavorite(
            image: 'assets/images/Redmi_Note_9_Pro_5G_6.png',
            title: 'Samsung Gtx 10',
            detail: 'dvfnvfdnjv dfjnvjkdnvdfjvn dkvnndfvnjfd dfkvnjfdvjn fdjvnjfdvn',
            ram: 4,
            storage: 120,
            contitu: 1,
            price: 1200,
            deletCard: (){},
          )

        ],

      ),
    );
  }
}

