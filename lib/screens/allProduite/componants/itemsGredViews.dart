import 'package:flutter/material.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';

class ItemsGredViews extends StatelessWidget {
  const ItemsGredViews({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        for (var i = 0; i < (20/2); i++)
          SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardPhoneItems(
                  title: '$i',
                  price: 50000,
                  descreption: 'hemddv v dvdfv dvdf vdf vdfv ',
                  image:
                  'assets/images/samsung-galaxy-s8-4g-smartphone-png-favpng-qNm18RuFag7316FekDYk0Pqy4.jpg',
                  pricintage: 20,
                ),
                CardPhoneItems(
                  title: '${i+ 20/2 }',
                  price: 50000,
                  descreption: 'hemddv v dvdfv dvdf vdf vdfv ',
                  image:
                  'assets/images/samsung-galaxy-s8-4g-smartphone-png-favpng-qNm18RuFag7316FekDYk0Pqy4.jpg',
                  pricintage: 20,
                ),
              ],
            ),
          ),
      ],

    );
  }
}

