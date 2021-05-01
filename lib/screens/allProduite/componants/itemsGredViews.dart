import 'package:flutter/material.dart';
import 'package:phoneshop/screens/homescreen/componants/item_cards_phones.dart';

class ItemsGredViews extends StatelessWidget {
  const ItemsGredViews({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: GridView(
        children: [
          for (var i = 0; i < 20; i++)
            CardPhoneItems(
              title: 'Sumsung',
              price: 50000,
              descreption: 'hemddv v dvdfv dvdf vdf vdfv ',
              image:
              'assets/images/samsung-galaxy-s8-4g-smartphone-png-favpng-qNm18RuFag7316FekDYk0Pqy4.jpg',
              pricintage: 20,
            ),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: size.width / 2 ,
          childAspectRatio: (size.width / 2) / 350,
          crossAxisSpacing: 2,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }
}

